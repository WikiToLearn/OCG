import json
import os.path

out_file="npm-deps-install.sh"
npm_deps={}
npm_install_cmd="npm install -g "


if not os.path.exists(out_file):
    print( "You must have the {} file".format(out_file))
else:
    for file in ['mw-ocg-bundler/package.json', 'mw-ocg-latexer/package.json', 'mw-ocg-service/package.json', 'mw-ocg-texter/package.json']:
        print ("=> ",file)
        with open(file) as data_file:
            data = json.load(data_file)
            for v in (data['dependencies']):
                npm_deps[v+"@"+data['dependencies'][v]]=True
            for v in (data['devDependencies']):
                npm_deps[v+"@"+data['devDependencies'][v]]=True

    for npm_dep in npm_deps:
        if "mw-ocg-" not in npm_dep:
            npm_install_cmd = npm_install_cmd + npm_dep + " "

    print ("Write to {}".format(out_file))
    target = open(out_file, 'w')
    target.write("#!/bin/bash\n")
    target.write(npm_install_cmd+"\n")
    target.close()
