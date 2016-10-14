#!/usr/bin/env python2
import json
import os.path
if not os.path.exists('Dockerfile'):
    print( "You must have the Dockerfile file")
else:
    output = ""
    outputAppend = True
    f = open('Dockerfile', 'rb+')
    for line in f:
        if line.strip() == "# START_DEP_RESOLVER":
            outputAppend = False
            output = output + "# START_DEP_RESOLVER\n"
            npm_deps = {}
            for file in ['mw-ocg-texter/package.json']:
                with open(file) as data_file:
                    data = json.load(data_file)
                    for v in (data['dependencies']):
                        npm_deps[v+"@"+data['dependencies'][v]]=True
                    for v in (data['devDependencies']):
                        npm_deps[v+"@"+data['devDependencies'][v]]=True
            for dep in npm_deps:
                output = output + "RUN npm install -g " + dep + "\n"
        elif line.strip() == "# END_DEP_RESOLVER":
            outputAppend = True

        if outputAppend:
            output = output + line.strip() + "\n"
    f.close()

    target = open('Dockerfile', 'w')
    target.write(output)
    target.close()
