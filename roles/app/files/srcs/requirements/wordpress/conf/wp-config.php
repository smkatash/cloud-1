<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 * @link https://developer.wordpress.org/apis/wp-config-php/
 * @link https://core.trac.wordpress.org/browser/trunk/wp-config-sample.php
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME',  getenv('DB_NAME'));

/** MySQL database username */
define( 'DB_USER', getenv('DB_USER') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('DB_USER_PWD') );

/** MySQL hostname */
define( 'DB_HOST', getenv('DB_HOST') );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'dpV./thyur-KqDV5@QBorDY:hQ-FaNTVJsj.|}6%|sq(a7@HDhtUlQqj`_w|i*FW');
define('SECURE_AUTH_KEY',  'fO+0l0eLCvb>r:yNDmb,|8eS][ujJAN|[Y*A@X3MO=pW)8#hr:b.1-Vm,%c^.%)-');
define('LOGGED_IN_KEY',    '?(Rydq|i}!70jv&q7y1Zs*uN]{K+Myym-D |`U]eB;or.r[-z*o=87L]byq^ZQ2|');
define('NONCE_KEY',        'oTE9+pK3@oA!;B`ic;#p.`|is6O=kfJD!C-pkb}1QqB@f[e.%?2 WiT7o^#YO.[?');
define('AUTH_SALT',        'h_dGi-jXam3!R!N,_&{6So)+4y.-:$^t<?iov]Q:PZU:Z:X>^y3PVYBci/WeNO|0');
define('SECURE_AUTH_SALT', 'eaQ/+fU~ =UuT[YLApmyvHRP$8g|LtMGha<89/O#=>pp>+^lW~+|(itLYiX+q<NK');
define('LOGGED_IN_SALT',   'd)Z6<@+1w58hnlh%/g8i2nyYK@L_|!%Fb:jM-x}?f/_J#XE MDm7CI+;uCg2E*GH');
define('NONCE_SALT',       'm-8k*=:Csp/(U%s?y3lP:qVt&J5$(B_wi IH&;og8v! uHQ[/^V$,mvf u]WoK)&');
/**#@-*/

/**
 * WordPress Database Table prefix.
*/
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
