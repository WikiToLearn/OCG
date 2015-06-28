"use strict";

exports.setup = function( parsoidConfig ) {
        parsoidConfig.setInterwiki( 'dewikifm', 'http://de.wikifm.org/api.php' );
        parsoidConfig.setInterwiki( 'enwikifm', 'http://en.wikifm.org/api.php' );
        parsoidConfig.setInterwiki( 'eswikifm', 'http://es.wikifm.org/api.php' );
        parsoidConfig.setInterwiki( 'frwikifm', 'http://fr.wikifm.org/api.php' );
        parsoidConfig.setInterwiki( 'itwikifm', 'http://it.wikifm.org/api.php' );
        parsoidConfig.debug = true;
        parsoidConfig.useSelser = true;
        parsoidConfig.allowCORS = '*';
        parsoidConfig.serverPort = 8000;
};
