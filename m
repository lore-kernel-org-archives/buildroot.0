From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 14:41:01 +0100
Subject: [Buildroot] [git commit] package/perl-*: regeneration of Config.in
 files with full stop
Message-ID: <20181101133903.6F5BD811AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da9e06cabc578bf9138e100d1492a2d5f2038415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-apache-logformat-compiler/Config.in         | 2 +-
 package/perl-astro-suntime/Config.in                     | 2 +-
 package/perl-class-inspector/Config.in                   | 2 +-
 package/perl-class-load/Config.in                        | 2 +-
 package/perl-class-method-modifiers/Config.in            | 2 +-
 package/perl-class-std-fast/Config.in                    | 2 +-
 package/perl-class-std/Config.in                         | 2 +-
 package/perl-convert-asn1/Config.in                      | 2 +-
 package/perl-cookie-baker/Config.in                      | 2 +-
 package/perl-crypt-blowfish/Config.in                    | 2 +-
 package/perl-crypt-cbc/Config.in                         | 2 +-
 package/perl-crypt-openssl-random/Config.in              | 2 +-
 package/perl-crypt-openssl-rsa/Config.in                 | 2 +-
 package/perl-data-dump/Config.in                         | 2 +-
 package/perl-data-optlist/Config.in                      | 2 +-
 package/perl-data-uuid/Config.in                         | 2 +-
 package/perl-date-manip/Config.in                        | 2 +-
 package/perl-datetime-tiny/Config.in                     | 2 +-
 package/perl-dbd-mysql/Config.in                         | 2 +-
 package/perl-dbi/Config.in                               | 2 +-
 package/perl-devel-stacktrace-ashtml/Config.in           | 2 +-
 package/perl-devel-stacktrace/Config.in                  | 2 +-
 package/perl-digest-hmac/Config.in                       | 2 +-
 package/perl-digest-md5/Config.in                        | 2 +-
 package/perl-digest-sha1/Config.in                       | 2 +-
 package/perl-dist-checkconflicts/Config.in               | 2 +-
 package/perl-encode-detect/Config.in                     | 2 +-
 package/perl-encode-locale/Config.in                     | 2 +-
 package/perl-exporter-tiny/Config.in                     | 2 +-
 package/perl-file-listing/Config.in                      | 2 +-
 package/perl-file-sharedir/Config.in                     | 2 +-
 package/perl-file-slurp/Config.in                        | 2 +-
 package/perl-file-util/Config.in                         | 2 +-
 package/perl-filesys-notify-simple/Config.in             | 2 +-
 package/perl-gd/Config.in                                | 2 +-
 package/perl-gdgraph/Config.in                           | 2 +-
 package/perl-gdtextutil/Config.in                        | 2 +-
 package/perl-hash-multivalue/Config.in                   | 2 +-
 package/perl-html-parser/Config.in                       | 2 +-
 package/perl-html-tagset/Config.in                       | 2 +-
 package/perl-http-cookies/Config.in                      | 2 +-
 package/perl-http-daemon/Config.in                       | 2 +-
 package/perl-http-date/Config.in                         | 2 +-
 package/perl-http-entity-parser/Config.in                | 2 +-
 package/perl-http-headers-fast/Config.in                 | 2 +-
 package/perl-http-message/Config.in                      | 2 +-
 package/perl-http-multipartparser/Config.in              | 2 +-
 package/perl-http-negotiate/Config.in                    | 2 +-
 package/perl-io-html/Config.in                           | 2 +-
 package/perl-io-interface/Config.in                      | 2 +-
 package/perl-io-socket-multicast/Config.in               | 2 +-
 package/perl-json-maybexs/Config.in                      | 3 ++-
 package/perl-libwww-perl/Config.in                       | 2 +-
 package/perl-lwp-mediatypes/Config.in                    | 2 +-
 package/perl-mail-dkim/Config.in                         | 2 +-
 package/perl-mailtools/Config.in                         | 2 +-
 package/perl-mime-base64-urlsafe/Config.in               | 2 +-
 package/perl-mime-base64/Config.in                       | 2 +-
 package/perl-mime-tools/Config.in                        | 2 +-
 package/perl-module-implementation/Config.in             | 2 +-
 package/perl-module-runtime/Config.in                    | 2 +-
 package/perl-mojolicious-plugin-authentication/Config.in | 2 +-
 package/perl-mojolicious/Config.in                       | 2 +-
 package/perl-moo/Config.in                               | 2 +-
 package/perl-net-dns/Config.in                           | 2 +-
 package/perl-net-http/Config.in                          | 2 +-
 package/perl-net-ping/Config.in                          | 2 +-
 package/perl-net-snmp/Config.in                          | 2 +-
 package/perl-net-ssleay/Config.in                        | 3 +--
 package/perl-net-telnet/Config.in                        | 2 +-
 package/perl-netaddr-ip/Config.in                        | 2 +-
 package/perl-number-bytes-human/Config.in                | 2 +-
 package/perl-package-stash/Config.in                     | 2 +-
 package/perl-params-util/Config.in                       | 2 +-
 package/perl-path-tiny/Config.in                         | 2 +-
 package/perl-plack/Config.in                             | 2 +-
 package/perl-posix-strftime-compiler/Config.in           | 2 +-
 package/perl-stream-buffered/Config.in                   | 2 +-
 package/perl-sub-exporter-progressive/Config.in          | 2 +-
 package/perl-sub-install/Config.in                       | 2 +-
 package/perl-sub-quote/Config.in                         | 2 +-
 package/perl-sys-meminfo/Config.in                       | 2 +-
 package/perl-sys-mmap/Config.in                          | 2 +-
 package/perl-time-hires/Config.in                        | 2 +-
 package/perl-time-parsedate/Config.in                    | 2 +-
 package/perl-timedate/Config.in                          | 2 +-
 package/perl-try-tiny/Config.in                          | 2 +-
 package/perl-type-tiny/Config.in                         | 2 +-
 package/perl-uri/Config.in                               | 2 +-
 package/perl-www-form-urlencoded/Config.in               | 2 +-
 package/perl-www-robotrules/Config.in                    | 2 +-
 package/perl-x10/Config.in                               | 2 +-
 package/perl-xml-libxml/Config.in                        | 2 +-
 package/perl-xml-namespacesupport/Config.in              | 2 +-
 package/perl-xml-sax-base/Config.in                      | 2 +-
 package/perl-xml-sax/Config.in                           | 2 +-
 96 files changed, 97 insertions(+), 97 deletions(-)

diff --git a/package/perl-apache-logformat-compiler/Config.in b/package/perl-apache-logformat-compiler/Config.in
index 8506837dd4..d78104f16b 100644
--- a/package/perl-apache-logformat-compiler/Config.in
+++ b/package/perl-apache-logformat-compiler/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
 	bool "perl-apache-logformat-compiler"
 	select BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER # runtime
 	help
-	  Compile a log format string to perl-code
+	  Compile a log format string to perl-code.
 
 	  https://github.com/kazeburo/Apache-LogFormat-Compiler
diff --git a/package/perl-astro-suntime/Config.in b/package/perl-astro-suntime/Config.in
index 22e2cb1aa2..ee4f3e32f0 100644
--- a/package/perl-astro-suntime/Config.in
+++ b/package/perl-astro-suntime/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_ASTRO_SUNTIME
 	bool "perl-astro-suntime"
 	help
-	  A functional module for calculating sunrise/sunset times
+	  A functional module for calculating sunrise/sunset times.
 
 	  https://metacpan.org/release/Astro-SunTime
diff --git a/package/perl-class-inspector/Config.in b/package/perl-class-inspector/Config.in
index fac3688d5a..46b9368249 100644
--- a/package/perl-class-inspector/Config.in
+++ b/package/perl-class-inspector/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_CLASS_INSPECTOR
 	bool "perl-class-inspector"
 	help
-	  Get information about a class and its structure
+	  Get information about a class and its structure.
 
 	  https://metacpan.org/pod/Class::Inspector
diff --git a/package/perl-class-load/Config.in b/package/perl-class-load/Config.in
index eb0bd366a2..fe956b177d 100644
--- a/package/perl-class-load/Config.in
+++ b/package/perl-class-load/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PERL_CLASS_LOAD
 	select BR2_PACKAGE_PERL_PACKAGE_STASH # runtime
 	select BR2_PACKAGE_PERL_TRY_TINY # runtime
 	help
-	  A working (require "Class::Name") and more
+	  A working (require "Class::Name") and more.
 
 	  https://github.com/moose/Class-Load
 
diff --git a/package/perl-class-method-modifiers/Config.in b/package/perl-class-method-modifiers/Config.in
index 4d46946430..7acdb38b9d 100644
--- a/package/perl-class-method-modifiers/Config.in
+++ b/package/perl-class-method-modifiers/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_CLASS_METHOD_MODIFIERS
 	bool "perl-class-method-modifiers"
 	help
-	  Provides Moose-like method modifiers
+	  Provides Moose-like method modifiers.
 
 	  https://github.com/moose/Class-Method-Modifiers
diff --git a/package/perl-class-std-fast/Config.in b/package/perl-class-std-fast/Config.in
index 6f5994ef59..6eabc0bb04 100644
--- a/package/perl-class-std-fast/Config.in
+++ b/package/perl-class-std-fast/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_CLASS_STD_FAST
 	bool "perl-class-std-fast"
 	select BR2_PACKAGE_PERL_CLASS_STD # runtime
 	help
-	  faster but less secure than Class::Std
+	  faster but less secure than Class::Std.
 
 	  https://metacpan.org/release/Class-Std-Fast
diff --git a/package/perl-class-std/Config.in b/package/perl-class-std/Config.in
index 10734a7902..332cdf27c3 100644
--- a/package/perl-class-std/Config.in
+++ b/package/perl-class-std/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_CLASS_STD
 	bool "perl-class-std"
 	help
-	  Support for creating standard "inside-out" classes
+	  Support for creating standard "inside-out" classes.
 
 	  https://metacpan.org/release/Class-Std
diff --git a/package/perl-convert-asn1/Config.in b/package/perl-convert-asn1/Config.in
index 2fb08fa040..3fe47c3260 100644
--- a/package/perl-convert-asn1/Config.in
+++ b/package/perl-convert-asn1/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_CONVERT_ASN1
 	bool "perl-convert-asn1"
 	help
 	  Convert between perl data structures and ASN.1 encoded
-	  packets
+	  packets.
 
 	  https://metacpan.org/release/Convert-ASN1
diff --git a/package/perl-cookie-baker/Config.in b/package/perl-cookie-baker/Config.in
index 9e746237a2..024f0ade25 100644
--- a/package/perl-cookie-baker/Config.in
+++ b/package/perl-cookie-baker/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_COOKIE_BAKER
 	bool "perl-cookie-baker"
 	select BR2_PACKAGE_PERL_URI # runtime
 	help
-	  Cookie string generator / parser
+	  Cookie string generator / parser.
 
 	  https://github.com/kazeburo/Cookie-Baker
diff --git a/package/perl-crypt-blowfish/Config.in b/package/perl-crypt-blowfish/Config.in
index 093f11d95b..1a51a16f8f 100644
--- a/package/perl-crypt-blowfish/Config.in
+++ b/package/perl-crypt-blowfish/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_CRYPT_BLOWFISH
 	bool "perl-crypt-blowfish"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Perl Blowfish encryption module
+	  Perl Blowfish encryption module.
 
 	  https://metacpan.org/release/Crypt-Blowfish
 
diff --git a/package/perl-crypt-cbc/Config.in b/package/perl-crypt-cbc/Config.in
index 7ecfa70552..5cd9c69ea2 100644
--- a/package/perl-crypt-cbc/Config.in
+++ b/package/perl-crypt-cbc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_CRYPT_CBC
 	bool "perl-crypt-cbc"
 	help
-	  Encrypt Data with Cipher Block Chaining Mode
+	  Encrypt Data with Cipher Block Chaining Mode.
 
 	  https://metacpan.org/release/Crypt-CBC
diff --git a/package/perl-crypt-openssl-random/Config.in b/package/perl-crypt-openssl-random/Config.in
index 480e5158ff..6b5da7c881 100644
--- a/package/perl-crypt-openssl-random/Config.in
+++ b/package/perl-crypt-openssl-random/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	help
-	  OpenSSL/LibreSSL pseudo-random number generator access
+	  OpenSSL/LibreSSL pseudo-random number generator access.
 
 	  https://metacpan.org/release/Crypt-OpenSSL-Random
 
diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index 155ec03ecf..e58a921bcb 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
 	help
-	  RSA encoding and decoding, using the openSSL libraries
+	  RSA encoding and decoding, using the openSSL libraries.
 
 	  http://github.com/toddr/Crypt-OpenSSL-RSA
 
diff --git a/package/perl-data-dump/Config.in b/package/perl-data-dump/Config.in
index a44291baae..b44209fe76 100644
--- a/package/perl-data-dump/Config.in
+++ b/package/perl-data-dump/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DATA_DUMP
 	bool "perl-data-dump"
 	help
-	  Pretty printing of data structures
+	  Pretty printing of data structures.
 
 	  https://metacpan.org/release/Data-Dump
diff --git a/package/perl-data-optlist/Config.in b/package/perl-data-optlist/Config.in
index a95ca05f5b..88152f27b4 100644
--- a/package/perl-data-optlist/Config.in
+++ b/package/perl-data-optlist/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_DATA_OPTLIST
 	select BR2_PACKAGE_PERL_PARAMS_UTIL # runtime
 	select BR2_PACKAGE_PERL_SUB_INSTALL # runtime
 	help
-	  parse and validate simple name/value option pairs
+	  parse and validate simple name/value option pairs.
 
 	  https://github.com/rjbs/Data-OptList
 
diff --git a/package/perl-data-uuid/Config.in b/package/perl-data-uuid/Config.in
index e0752c44ab..9b4812b233 100644
--- a/package/perl-data-uuid/Config.in
+++ b/package/perl-data-uuid/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_DATA_UUID
 	bool "perl-data-uuid"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Globally/Universally Unique Identifiers (GUIDs/UUIDs)
+	  Globally/Universally Unique Identifiers (GUIDs/UUIDs).
 
 	  https://metacpan.org/release/Data-UUID
 
diff --git a/package/perl-date-manip/Config.in b/package/perl-date-manip/Config.in
index cbfb5c5b30..4ebcd4da43 100644
--- a/package/perl-date-manip/Config.in
+++ b/package/perl-date-manip/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DATE_MANIP
 	bool "perl-date-manip"
 	help
-	  Date manipulation routines
+	  Date manipulation routines.
 
 	  https://metacpan.org/release/Date-Manip
diff --git a/package/perl-datetime-tiny/Config.in b/package/perl-datetime-tiny/Config.in
index 7721c0769a..ea44ae0c25 100644
--- a/package/perl-datetime-tiny/Config.in
+++ b/package/perl-datetime-tiny/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DATETIME_TINY
 	bool "perl-datetime-tiny"
 	help
-	  A date object, with as little code as possible
+	  A date object, with as little code as possible.
 
 	  https://github.com/dagolden/DateTime-Tiny
diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index c00d64be6d..55bbc95347 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
-	  A MySQL driver for the Perl5 Database Interface (DBI)
+	  A MySQL driver for the Perl5 Database Interface (DBI).
 
 	  http://dbi.perl.org/
 
diff --git a/package/perl-dbi/Config.in b/package/perl-dbi/Config.in
index 069669b9bc..2c08c73379 100644
--- a/package/perl-dbi/Config.in
+++ b/package/perl-dbi/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_DBI
 	bool "perl-dbi"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Database independent interface for Perl
+	  Database independent interface for Perl.
 
 	  http://dbi.perl.org/
 
diff --git a/package/perl-devel-stacktrace-ashtml/Config.in b/package/perl-devel-stacktrace-ashtml/Config.in
index ce6f750bde..9c73f0e4ff 100644
--- a/package/perl-devel-stacktrace-ashtml/Config.in
+++ b/package/perl-devel-stacktrace-ashtml/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML
 	bool "perl-devel-stacktrace-ashtml"
 	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE # runtime
 	help
-	  Displays stack trace in HTML
+	  Displays stack trace in HTML.
 
 	  https://github.com/miyagawa/Devel-StackTrace-AsHTML
diff --git a/package/perl-devel-stacktrace/Config.in b/package/perl-devel-stacktrace/Config.in
index fe6e3e5d7a..3311f72e96 100644
--- a/package/perl-devel-stacktrace/Config.in
+++ b/package/perl-devel-stacktrace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DEVEL_STACKTRACE
 	bool "perl-devel-stacktrace"
 	help
-	  An object representing a stack trace
+	  An object representing a stack trace.
 
 	  http://metacpan.org/release/Devel-StackTrace
diff --git a/package/perl-digest-hmac/Config.in b/package/perl-digest-hmac/Config.in
index 91b1b94f49..bb9b454174 100644
--- a/package/perl-digest-hmac/Config.in
+++ b/package/perl-digest-hmac/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DIGEST_HMAC
 	bool "perl-digest-hmac"
 	help
-	  Keyed-Hashing for Message Authentication
+	  Keyed-Hashing for Message Authentication.
 
 	  https://metacpan.org/release/Digest-HMAC
diff --git a/package/perl-digest-md5/Config.in b/package/perl-digest-md5/Config.in
index e8bb3fd8e7..88aeab6fc0 100644
--- a/package/perl-digest-md5/Config.in
+++ b/package/perl-digest-md5/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_DIGEST_MD5
 	bool "perl-digest-md5"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Perl interface to the MD-5 algorithm
+	  Perl interface to the MD-5 algorithm.
 
 	  https://metacpan.org/release/Digest-MD5
 
diff --git a/package/perl-digest-sha1/Config.in b/package/perl-digest-sha1/Config.in
index b72a4ae938..1e093a04a2 100644
--- a/package/perl-digest-sha1/Config.in
+++ b/package/perl-digest-sha1/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_DIGEST_SHA1
 	bool "perl-digest-sha1"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Perl interface to the SHA-1 algorithm
+	  Perl interface to the SHA-1 algorithm.
 
 	  https://metacpan.org/release/Digest-SHA1
 
diff --git a/package/perl-dist-checkconflicts/Config.in b/package/perl-dist-checkconflicts/Config.in
index e834d01136..b34496e799 100644
--- a/package/perl-dist-checkconflicts/Config.in
+++ b/package/perl-dist-checkconflicts/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
 	bool "perl-dist-checkconflicts"
 	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
 	help
-	  declare version conflicts for your dist
+	  declare version conflicts for your dist.
 
 	  http://metacpan.org/release/Dist-CheckConflicts
diff --git a/package/perl-encode-detect/Config.in b/package/perl-encode-detect/Config.in
index 62e1baa7ca..63ea432917 100644
--- a/package/perl-encode-detect/Config.in
+++ b/package/perl-encode-detect/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_ENCODE_DETECT
 	depends on !BR2_STATIC_LIBS
 	help
 	  An Encode::Encoding subclass that detects the encoding of
-	  data
+	  data.
 
 	  https://metacpan.org/release/Encode-Detect
 
diff --git a/package/perl-encode-locale/Config.in b/package/perl-encode-locale/Config.in
index b580f64760..836e736cd3 100644
--- a/package/perl-encode-locale/Config.in
+++ b/package/perl-encode-locale/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_ENCODE_LOCALE
 	bool "perl-encode-locale"
 	help
-	  Determine the locale encoding
+	  Determine the locale encoding.
 
 	  https://metacpan.org/release/Encode-Locale
diff --git a/package/perl-exporter-tiny/Config.in b/package/perl-exporter-tiny/Config.in
index 1ee001ef14..04839ac15c 100644
--- a/package/perl-exporter-tiny/Config.in
+++ b/package/perl-exporter-tiny/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_EXPORTER_TINY
 	bool "perl-exporter-tiny"
 	help
 	  an exporter with the features of Sub::Exporter but only core
-	  dependencies
+	  dependencies.
 
 	  https://metacpan.org/release/Exporter-Tiny
diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
index e1fbb05b72..acca98be22 100644
--- a/package/perl-file-listing/Config.in
+++ b/package/perl-file-listing/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_FILE_LISTING
 	bool "perl-file-listing"
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	help
-	  parse directory listing
+	  parse directory listing.
 
 	  https://metacpan.org/release/File-Listing
diff --git a/package/perl-file-sharedir/Config.in b/package/perl-file-sharedir/Config.in
index b8dee5acd7..169569f77c 100644
--- a/package/perl-file-sharedir/Config.in
+++ b/package/perl-file-sharedir/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_FILE_SHAREDIR
 	bool "perl-file-sharedir"
 	select BR2_PACKAGE_PERL_CLASS_INSPECTOR # runtime
 	help
-	  Locate per-dist and per-module shared files
+	  Locate per-dist and per-module shared files.
 
 	  https://metacpan.org/release/File-ShareDir
diff --git a/package/perl-file-slurp/Config.in b/package/perl-file-slurp/Config.in
index 69a8871717..33b6d33768 100644
--- a/package/perl-file-slurp/Config.in
+++ b/package/perl-file-slurp/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_FILE_SLURP
 	bool "perl-file-slurp"
 	help
 	  Simple and Efficient Reading/Writing/Modifying of Complete
-	  Files
+	  Files.
 
 	  https://metacpan.org/release/File-Slurp
diff --git a/package/perl-file-util/Config.in b/package/perl-file-util/Config.in
index 871be988af..ddd155be77 100644
--- a/package/perl-file-util/Config.in
+++ b/package/perl-file-util/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_FILE_UTIL
 	bool "perl-file-util"
 	help
-	  Easy, versatile, portable file handling
+	  Easy, versatile, portable file handling.
 
 	  https://github.com/tommybutler/file-util/wiki
diff --git a/package/perl-filesys-notify-simple/Config.in b/package/perl-filesys-notify-simple/Config.in
index 69469d7a6d..bff3cc6114 100644
--- a/package/perl-filesys-notify-simple/Config.in
+++ b/package/perl-filesys-notify-simple/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_FILESYS_NOTIFY_SIMPLE
 	bool "perl-filesys-notify-simple"
 	help
-	  Simple and dumb file system watcher
+	  Simple and dumb file system watcher.
 
 	  https://github.com/miyagawa/Filesys-Notify-Simple
diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 2b7a265f15..ef28f7b971 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GD
 	help
-	  Perl interface to the gd2 graphics library
+	  Perl interface to the gd2 graphics library.
 
 	  https://metacpan.org/release/GD
 
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
index e0b6a25a43..d8885fe0eb 100644
--- a/package/perl-gdgraph/Config.in
+++ b/package/perl-gdgraph/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_GDGRAPH
 	select BR2_PACKAGE_PERL_GD # runtime
 	select BR2_PACKAGE_PERL_GDTEXTUTIL # runtime
 	help
-	  Produces charts with GD
+	  Produces charts with GD.
 
 	  https://metacpan.org/release/GDGraph
 
diff --git a/package/perl-gdtextutil/Config.in b/package/perl-gdtextutil/Config.in
index 9baf0a078b..cff328e064 100644
--- a/package/perl-gdtextutil/Config.in
+++ b/package/perl-gdtextutil/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_GDTEXTUTIL
 	bool "perl-gdtextutil"
 	help
-	  Text utilities for use with GD
+	  Text utilities for use with GD.
 
 	  https://metacpan.org/release/GDTextUtil
diff --git a/package/perl-hash-multivalue/Config.in b/package/perl-hash-multivalue/Config.in
index 0883c95d86..8621983d45 100644
--- a/package/perl-hash-multivalue/Config.in
+++ b/package/perl-hash-multivalue/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HASH_MULTIVALUE
 	bool "perl-hash-multivalue"
 	help
-	  Store multiple values per key
+	  Store multiple values per key.
 
 	  https://github.com/miyagawa/Hash-MultiValue
diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
index bc1c9a59e3..10cd95e484 100644
--- a/package/perl-html-parser/Config.in
+++ b/package/perl-html-parser/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PERL_HTML_PARSER
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_HTML_TAGSET # runtime
 	help
-	  HTML parser class
+	  HTML parser class.
 
 	  https://metacpan.org/release/HTML-Parser
 
diff --git a/package/perl-html-tagset/Config.in b/package/perl-html-tagset/Config.in
index 7e3b33dfb3..4956198f59 100644
--- a/package/perl-html-tagset/Config.in
+++ b/package/perl-html-tagset/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HTML_TAGSET
 	bool "perl-html-tagset"
 	help
-	  data tables useful in parsing HTML
+	  data tables useful in parsing HTML.
 
 	  https://metacpan.org/release/HTML-Tagset
diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 117e11a84d..fd869f0644 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_HTTP_COOKIES
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
-	  HTTP cookie jars
+	  HTTP cookie jars.
 
 	  https://github.com/libwww-perl/http-cookies
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index ff302c12b1..bc03b8c8c5 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -4,6 +4,6 @@ config BR2_PACKAGE_PERL_HTTP_DAEMON
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
 	help
-	  a simple http server class
+	  a simple http server class.
 
 	  https://metacpan.org/release/HTTP-Daemon
diff --git a/package/perl-http-date/Config.in b/package/perl-http-date/Config.in
index 4d7b4d18d4..12524e6dac 100644
--- a/package/perl-http-date/Config.in
+++ b/package/perl-http-date/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_DATE
 	bool "perl-http-date"
 	help
-	  date conversion routines
+	  date conversion routines.
 
 	  https://metacpan.org/release/HTTP-Date
diff --git a/package/perl-http-entity-parser/Config.in b/package/perl-http-entity-parser/Config.in
index 998182aace..445366b71d 100644
--- a/package/perl-http-entity-parser/Config.in
+++ b/package/perl-http-entity-parser/Config.in
@@ -6,6 +6,6 @@ config BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER
 	select BR2_PACKAGE_PERL_STREAM_BUFFERED # runtime
 	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED # runtime
 	help
-	  PSGI compliant HTTP Entity Parser
+	  PSGI compliant HTTP Entity Parser.
 
 	  https://github.com/kazeburo/HTTP-Entity-Parser
diff --git a/package/perl-http-headers-fast/Config.in b/package/perl-http-headers-fast/Config.in
index fe022ae30a..b4b19e5b2c 100644
--- a/package/perl-http-headers-fast/Config.in
+++ b/package/perl-http-headers-fast/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_HTTP_HEADERS_FAST
 	bool "perl-http-headers-fast"
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	help
-	  faster implementation of HTTP::Headers
+	  faster implementation of HTTP::Headers.
 
 	  https://github.com/tokuhirom/HTTP-Headers-Fast
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index c8162cae35..82538cfce8 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -6,6 +6,6 @@ config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
 	select BR2_PACKAGE_PERL_URI # runtime
 	help
-	  HTTP style message (base class)
+	  HTTP style message (base class).
 
 	  https://github.com/libwww-perl/HTTP-Message
diff --git a/package/perl-http-multipartparser/Config.in b/package/perl-http-multipartparser/Config.in
index 70b89a3870..93c196ca1b 100644
--- a/package/perl-http-multipartparser/Config.in
+++ b/package/perl-http-multipartparser/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MULTIPARTPARSER
 	bool "perl-http-multipartparser"
 	help
-	  HTTP MultiPart Parser
+	  HTTP MultiPart Parser.
 
 	  https://metacpan.org/release/HTTP-MultiPartParser
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index 20838d9cd7..c519ede2df 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
-	  choose a variant to serve
+	  choose a variant to serve.
 
 	  https://metacpan.org/release/HTTP-Negotiate
diff --git a/package/perl-io-html/Config.in b/package/perl-io-html/Config.in
index fe67c63d07..e12e39a550 100644
--- a/package/perl-io-html/Config.in
+++ b/package/perl-io-html/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_IO_HTML
 	bool "perl-io-html"
 	help
-	  Open an HTML file with automatic charset detection
+	  Open an HTML file with automatic charset detection.
 
 	  https://metacpan.org/release/IO-HTML
diff --git a/package/perl-io-interface/Config.in b/package/perl-io-interface/Config.in
index 7aa7064ec0..e3137b2459 100644
--- a/package/perl-io-interface/Config.in
+++ b/package/perl-io-interface/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_IO_INTERFACE
 	bool "perl-io-interface"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Access and modify network interface card configuration
+	  Access and modify network interface card configuration.
 
 	  https://metacpan.org/release/IO-Interface
 
diff --git a/package/perl-io-socket-multicast/Config.in b/package/perl-io-socket-multicast/Config.in
index 87865eedf3..b1328c5b0c 100644
--- a/package/perl-io-socket-multicast/Config.in
+++ b/package/perl-io-socket-multicast/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PERL_IO_SOCKET_MULTICAST
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_IO_INTERFACE # runtime
 	help
-	  Send and receive multicast messages
+	  Send and receive multicast messages.
 
 	  https://metacpan.org/release/IO-Socket-Multicast
 
diff --git a/package/perl-json-maybexs/Config.in b/package/perl-json-maybexs/Config.in
index 1db82c3684..7959b2c3a5 100644
--- a/package/perl-json-maybexs/Config.in
+++ b/package/perl-json-maybexs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_JSON_MAYBEXS
 	bool "perl-json-maybexs"
 	help
-	  Use Cpanel::JSON::XS with a fallback to JSON::XS and JSON::PP
+	  Use Cpanel::JSON::XS with a fallback to JSON::XS and
+	  JSON::PP.
 
 	  https://metacpan.org/release/JSON-MaybeXS
diff --git a/package/perl-libwww-perl/Config.in b/package/perl-libwww-perl/Config.in
index b53e36a681..6e191dd529 100644
--- a/package/perl-libwww-perl/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_PERL_LIBWWW_PERL
 	select BR2_PACKAGE_PERL_URI # runtime
 	select BR2_PACKAGE_PERL_WWW_ROBOTRULES # runtime
 	help
-	  The World-Wide Web library for Perl
+	  The World-Wide Web library for Perl.
 
 	  https://github.com/libwww-perl/libwww-perl
 
diff --git a/package/perl-lwp-mediatypes/Config.in b/package/perl-lwp-mediatypes/Config.in
index 9b6538776d..4881090144 100644
--- a/package/perl-lwp-mediatypes/Config.in
+++ b/package/perl-lwp-mediatypes/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	bool "perl-lwp-mediatypes"
 	help
-	  guess media type for a file or a URL
+	  guess media type for a file or a URL.
 
 	  https://metacpan.org/release/LWP-MediaTypes
diff --git a/package/perl-mail-dkim/Config.in b/package/perl-mail-dkim/Config.in
index f13ef0a4b4..057796b501 100644
--- a/package/perl-mail-dkim/Config.in
+++ b/package/perl-mail-dkim/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PERL_MAIL_DKIM
 	select BR2_PACKAGE_PERL_MAILTOOLS # runtime
 	select BR2_PACKAGE_PERL_NET_DNS # runtime
 	help
-	  Signs/verifies Internet mail with DKIM/DomainKey signatures
+	  Signs/verifies Internet mail with DKIM/DomainKey signatures.
 
 	  https://metacpan.org/release/Mail-DKIM
 
diff --git a/package/perl-mailtools/Config.in b/package/perl-mailtools/Config.in
index adbccd34fd..a442e7193d 100644
--- a/package/perl-mailtools/Config.in
+++ b/package/perl-mailtools/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_MAILTOOLS
 	bool "perl-mailtools"
 	select BR2_PACKAGE_PERL_TIMEDATE # runtime
 	help
-	  Various ancient e-mail related modules
+	  Various ancient e-mail related modules.
 
 	  https://metacpan.org/release/MailTools
diff --git a/package/perl-mime-base64-urlsafe/Config.in b/package/perl-mime-base64-urlsafe/Config.in
index 8abfdc25ab..be4540a473 100644
--- a/package/perl-mime-base64-urlsafe/Config.in
+++ b/package/perl-mime-base64-urlsafe/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_MIME_BASE64_URLSAFE
 	bool "perl-mime-base64-urlsafe"
 	help
-	  Perl version of Python's URL-safe base64 codec
+	  Perl version of Python's URL-safe base64 codec.
 
 	  https://metacpan.org/release/MIME-Base64-URLSafe
diff --git a/package/perl-mime-base64/Config.in b/package/perl-mime-base64/Config.in
index b1d9aa5215..ecb3d2ee68 100644
--- a/package/perl-mime-base64/Config.in
+++ b/package/perl-mime-base64/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_MIME_BASE64
 	bool "perl-mime-base64"
 	depends on !BR2_STATIC_LIBS
 	help
-	  The RFC 2045 encodings; base64 and quoted-printable
+	  The RFC 2045 encodings; base64 and quoted-printable.
 
 	  https://metacpan.org/release/MIME-Base64
 
diff --git a/package/perl-mime-tools/Config.in b/package/perl-mime-tools/Config.in
index d07d76f379..f8495c325f 100644
--- a/package/perl-mime-tools/Config.in
+++ b/package/perl-mime-tools/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_MIME_TOOLS
 	bool "perl-mime-tools"
 	select BR2_PACKAGE_PERL_MAILTOOLS # runtime
 	help
-	  Tools to manipulate MIME messages
+	  Tools to manipulate MIME messages.
 
 	  https://metacpan.org/release/MIME-tools
diff --git a/package/perl-module-implementation/Config.in b/package/perl-module-implementation/Config.in
index 713cd2a531..04561dea0a 100644
--- a/package/perl-module-implementation/Config.in
+++ b/package/perl-module-implementation/Config.in
@@ -4,6 +4,6 @@ config BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
 	select BR2_PACKAGE_PERL_TRY_TINY # runtime
 	help
 	  Loads one of several alternate underlying implementations for
-	  a module
+	  a module.
 
 	  http://metacpan.org/release/Module-Implementation
diff --git a/package/perl-module-runtime/Config.in b/package/perl-module-runtime/Config.in
index fca29f66df..1db03e5bae 100644
--- a/package/perl-module-runtime/Config.in
+++ b/package/perl-module-runtime/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_MODULE_RUNTIME
 	bool "perl-module-runtime"
 	help
-	  runtime module handling
+	  runtime module handling.
 
 	  https://metacpan.org/release/Module-Runtime
diff --git a/package/perl-mojolicious-plugin-authentication/Config.in b/package/perl-mojolicious-plugin-authentication/Config.in
index 0a7a3d62ec..4fa01806fd 100644
--- a/package/perl-mojolicious-plugin-authentication/Config.in
+++ b/package/perl-mojolicious-plugin-authentication/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION
 	bool "perl-mojolicious-plugin-authentication"
 	select BR2_PACKAGE_PERL_MOJOLICIOUS # runtime
 	help
-	  A plugin to make authentication a bit easier
+	  A plugin to make authentication a bit easier.
 
 	  https://metacpan.org/release/Mojolicious-Plugin-Authentication
diff --git a/package/perl-mojolicious/Config.in b/package/perl-mojolicious/Config.in
index 28d45a35fd..8bcce5f027 100644
--- a/package/perl-mojolicious/Config.in
+++ b/package/perl-mojolicious/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_MOJOLICIOUS
 	bool "perl-mojolicious"
 	help
-	  Real-time web framework
+	  Real-time web framework.
 
 	  https://mojolicious.org
diff --git a/package/perl-moo/Config.in b/package/perl-moo/Config.in
index 4d88e1a796..141b95ca58 100644
--- a/package/perl-moo/Config.in
+++ b/package/perl-moo/Config.in
@@ -6,6 +6,6 @@ config BR2_PACKAGE_PERL_MOO
 	select BR2_PACKAGE_PERL_ROLE_TINY # runtime
 	select BR2_PACKAGE_PERL_SUB_QUOTE # runtime
 	help
-	  Minimalist Object Orientation (with Moose compatibility)
+	  Minimalist Object Orientation (with Moose compatibility).
 
 	  https://metacpan.org/release/Moo
diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
index bc90b55cd9..cf68655447 100644
--- a/package/perl-net-dns/Config.in
+++ b/package/perl-net-dns/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_NET_DNS
 	bool "perl-net-dns"
 	select BR2_PACKAGE_PERL_DIGEST_HMAC # runtime
 	help
-	  Perl Interface to the Domain Name System
+	  Perl Interface to the Domain Name System.
 
 	  https://metacpan.org/release/Net-DNS
diff --git a/package/perl-net-http/Config.in b/package/perl-net-http/Config.in
index 522711f544..c09f3843b9 100644
--- a/package/perl-net-http/Config.in
+++ b/package/perl-net-http/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_NET_HTTP
 	bool "perl-net-http"
 	select BR2_PACKAGE_PERL_URI # runtime
 	help
-	  Low-level HTTP connection (client)
+	  Low-level HTTP connection (client).
 
 	  https://github.com/libwww-perl/Net-HTTP
diff --git a/package/perl-net-ping/Config.in b/package/perl-net-ping/Config.in
index a0ba7b0de1..21239a095f 100644
--- a/package/perl-net-ping/Config.in
+++ b/package/perl-net-ping/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NET_PING
 	bool "perl-net-ping"
 	help
-	  check a remote host for reachability
+	  check a remote host for reachability.
 
 	  https://metacpan.org/release/Net-Ping
diff --git a/package/perl-net-snmp/Config.in b/package/perl-net-snmp/Config.in
index e509292cd8..850cd9ba3e 100644
--- a/package/perl-net-snmp/Config.in
+++ b/package/perl-net-snmp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NET_SNMP
 	bool "perl-net-snmp"
 	help
-	  Object oriented interface to SNMP
+	  Object oriented interface to SNMP.
 
 	  https://metacpan.org/release/Net-SNMP
diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 80178e0b98..16b18c45d6 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_OPENSSL
 	help
-	  Perl extension for using OpenSSL
+	  Perl extension for using OpenSSL.
 
 	  https://metacpan.org/release/Net-SSLeay
 
diff --git a/package/perl-net-telnet/Config.in b/package/perl-net-telnet/Config.in
index 6d7993c608..c4f68072b7 100644
--- a/package/perl-net-telnet/Config.in
+++ b/package/perl-net-telnet/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NET_TELNET
 	bool "perl-net-telnet"
 	help
-	  Interact with TELNET port or other TCP ports
+	  Interact with TELNET port or other TCP ports.
 
 	  https://metacpan.org/release/Net-Telnet
diff --git a/package/perl-netaddr-ip/Config.in b/package/perl-netaddr-ip/Config.in
index d4061e1dfd..3536c3496a 100644
--- a/package/perl-netaddr-ip/Config.in
+++ b/package/perl-netaddr-ip/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NETADDR_IP
 	bool "perl-netaddr-ip"
 	help
-	  Manages IPv4 and IPv6 addresses and subnets
+	  Manages IPv4 and IPv6 addresses and subnets.
 
 	  https://metacpan.org/release/NetAddr-IP
diff --git a/package/perl-number-bytes-human/Config.in b/package/perl-number-bytes-human/Config.in
index ca43873d49..b56f70b002 100644
--- a/package/perl-number-bytes-human/Config.in
+++ b/package/perl-number-bytes-human/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NUMBER_BYTES_HUMAN
 	bool "perl-number-bytes-human"
 	help
-	  Convert byte count to human readable format
+	  Convert byte count to human readable format.
 
 	  https://metacpan.org/release/Number-Bytes-Human
diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index d7778e50c2..6b7ca24782 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_PACKAGE_STASH
 	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS # runtime
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
 	help
-	  routines for manipulating stashes
+	  routines for manipulating stashes.
 
 	  http://metacpan.org/release/Package-Stash
diff --git a/package/perl-params-util/Config.in b/package/perl-params-util/Config.in
index b155899b06..bbc821674f 100644
--- a/package/perl-params-util/Config.in
+++ b/package/perl-params-util/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_PARAMS_UTIL
 	bool "perl-params-util"
 	depends on !BR2_STATIC_LIBS
 	help
-	  Simple, compact and correct param-checking functions
+	  Simple, compact and correct param-checking functions.
 
 	  https://metacpan.org/release/Params-Util
 
diff --git a/package/perl-path-tiny/Config.in b/package/perl-path-tiny/Config.in
index f85e792dd9..f79de73e72 100644
--- a/package/perl-path-tiny/Config.in
+++ b/package/perl-path-tiny/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_PATH_TINY
 	bool "perl-path-tiny"
 	help
-	  File path utility
+	  File path utility.
 
 	  https://github.com/dagolden/Path-Tiny
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index 0401fa3e08..c81ac4a444 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -16,6 +16,6 @@ config BR2_PACKAGE_PERL_PLACK
 	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED # runtime
 	help
 	  Perl Superglue for Web frameworks and Web Servers (PSGI
-	  toolkit)
+	  toolkit).
 
 	  https://github.com/plack/Plack
diff --git a/package/perl-posix-strftime-compiler/Config.in b/package/perl-posix-strftime-compiler/Config.in
index 279d9f9a84..3c8d7d240f 100644
--- a/package/perl-posix-strftime-compiler/Config.in
+++ b/package/perl-posix-strftime-compiler/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER
 	bool "perl-posix-strftime-compiler"
 	help
-	  GNU C library compatible strftime for loggers and servers
+	  GNU C library compatible strftime for loggers and servers.
 
 	  https://github.com/kazeburo/POSIX-strftime-Compiler
diff --git a/package/perl-stream-buffered/Config.in b/package/perl-stream-buffered/Config.in
index a748ebbf77..3bddefe570 100644
--- a/package/perl-stream-buffered/Config.in
+++ b/package/perl-stream-buffered/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_STREAM_BUFFERED
 	bool "perl-stream-buffered"
 	help
-	  temporary buffer to save bytes
+	  temporary buffer to save bytes.
 
 	  https://github.com/plack/Stream-Buffered
diff --git a/package/perl-sub-exporter-progressive/Config.in b/package/perl-sub-exporter-progressive/Config.in
index 7e2911ea3d..e44de83e65 100644
--- a/package/perl-sub-exporter-progressive/Config.in
+++ b/package/perl-sub-exporter-progressive/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_SUB_EXPORTER_PROGRESSIVE
 	bool "perl-sub-exporter-progressive"
 	help
-	  Only use Sub::Exporter if you need it
+	  Only use Sub::Exporter if you need it.
 
 	  https://github.com/frioux/Sub-Exporter-Progressive
diff --git a/package/perl-sub-install/Config.in b/package/perl-sub-install/Config.in
index 41d57b237f..d1f539c085 100644
--- a/package/perl-sub-install/Config.in
+++ b/package/perl-sub-install/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_SUB_INSTALL
 	bool "perl-sub-install"
 	help
-	  install subroutines into packages easily
+	  install subroutines into packages easily.
 
 	  https://github.com/rjbs/Sub-Install
diff --git a/package/perl-sub-quote/Config.in b/package/perl-sub-quote/Config.in
index ae58b50afd..4487e9303c 100644
--- a/package/perl-sub-quote/Config.in
+++ b/package/perl-sub-quote/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_SUB_QUOTE
 	bool "perl-sub-quote"
 	help
-	  Efficient generation of subroutines via string eval
+	  Efficient generation of subroutines via string eval.
 
 	  https://metacpan.org/release/Sub-Quote
diff --git a/package/perl-sys-meminfo/Config.in b/package/perl-sys-meminfo/Config.in
index 3e3155d6cb..2175d88dd4 100644
--- a/package/perl-sys-meminfo/Config.in
+++ b/package/perl-sys-meminfo/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_SYS_MEMINFO
 	bool "perl-sys-meminfo"
 	depends on !BR2_STATIC_LIBS
 	help
-	  query the total free and used physical memory
+	  query the total free and used physical memory.
 
 	  https://metacpan.org/release/Sys-MemInfo
 
diff --git a/package/perl-sys-mmap/Config.in b/package/perl-sys-mmap/Config.in
index 56725f2faa..989e6bf23d 100644
--- a/package/perl-sys-mmap/Config.in
+++ b/package/perl-sys-mmap/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_SYS_MMAP
 	bool "perl-sys-mmap"
 	depends on !BR2_STATIC_LIBS
 	help
-	  uses mmap to map in a file as a Perl variable
+	  uses mmap to map in a file as a Perl variable.
 
 	  https://metacpan.org/release/Sys-Mmap
 
diff --git a/package/perl-time-hires/Config.in b/package/perl-time-hires/Config.in
index fe933a4d8e..db2ca039cb 100644
--- a/package/perl-time-hires/Config.in
+++ b/package/perl-time-hires/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_TIME_HIRES
 	bool "perl-time-hires"
 	depends on !BR2_STATIC_LIBS
 	help
-	  High resolution alarm, sleep, gettimeofday, interval timers
+	  High resolution alarm, sleep, gettimeofday, interval timers.
 
 	  https://metacpan.org/release/Time-HiRes
 
diff --git a/package/perl-time-parsedate/Config.in b/package/perl-time-parsedate/Config.in
index cea5d2941e..bd5957d919 100644
--- a/package/perl-time-parsedate/Config.in
+++ b/package/perl-time-parsedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIME_PARSEDATE
 	bool "perl-time-parsedate"
 	help
-	  Parse and format time values
+	  Parse and format time values.
 
 	  https://metacpan.org/release/Time-ParseDate
diff --git a/package/perl-timedate/Config.in b/package/perl-timedate/Config.in
index ee6d6692b0..84ba8ff6fe 100644
--- a/package/perl-timedate/Config.in
+++ b/package/perl-timedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIMEDATE
 	bool "perl-timedate"
 	help
-	  miscellaneous timezone manipulations routines
+	  miscellaneous timezone manipulations routines.
 
 	  https://metacpan.org/release/TimeDate
diff --git a/package/perl-try-tiny/Config.in b/package/perl-try-tiny/Config.in
index 5c115b638c..c4329dc1d5 100644
--- a/package/perl-try-tiny/Config.in
+++ b/package/perl-try-tiny/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TRY_TINY
 	bool "perl-try-tiny"
 	help
-	  Minimal try/catch with proper preservation of $@
+	  Minimal try/catch with proper preservation of $@.
 
 	  https://github.com/p5sagit/Try-Tiny
diff --git a/package/perl-type-tiny/Config.in b/package/perl-type-tiny/Config.in
index c4b956f8c3..c49a0d4bb8 100644
--- a/package/perl-type-tiny/Config.in
+++ b/package/perl-type-tiny/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_TYPE_TINY
 	bool "perl-type-tiny"
 	select BR2_PACKAGE_PERL_EXPORTER_TINY # runtime
 	help
-	  tiny, yet Moo(se)-compatible type constraint
+	  tiny, yet Moo(se)-compatible type constraint.
 
 	  https://metacpan.org/release/Type-Tiny
diff --git a/package/perl-uri/Config.in b/package/perl-uri/Config.in
index 23e5c50e0b..3f51c517f3 100644
--- a/package/perl-uri/Config.in
+++ b/package/perl-uri/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_URI
 	bool "perl-uri"
 	help
-	  Uniform Resource Identifiers (absolute and relative)
+	  Uniform Resource Identifiers (absolute and relative).
 
 	  https://github.com/libwww-perl/URI
diff --git a/package/perl-www-form-urlencoded/Config.in b/package/perl-www-form-urlencoded/Config.in
index f8e999e044..67759c8f7a 100644
--- a/package/perl-www-form-urlencoded/Config.in
+++ b/package/perl-www-form-urlencoded/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
 	bool "perl-www-form-urlencoded"
 	help
-	  parser and builder for application/x-www-form-urlencoded
+	  parser and builder for application/x-www-form-urlencoded.
 
 	  https://github.com/kazeburo/WWW-Form-UrlEncoded
diff --git a/package/perl-www-robotrules/Config.in b/package/perl-www-robotrules/Config.in
index 80db06f0c1..6ecf58afd5 100644
--- a/package/perl-www-robotrules/Config.in
+++ b/package/perl-www-robotrules/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_WWW_ROBOTRULES
 	bool "perl-www-robotrules"
 	select BR2_PACKAGE_PERL_URI # runtime
 	help
-	  database of robots.txt-derived permissions
+	  database of robots.txt-derived permissions.
 
 	  https://metacpan.org/release/WWW-RobotRules
diff --git a/package/perl-x10/Config.in b/package/perl-x10/Config.in
index 884dbb82d3..834ffefad5 100644
--- a/package/perl-x10/Config.in
+++ b/package/perl-x10/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PERL_X10
 	select BR2_PACKAGE_PERL_DEVICE_SERIALPORT # runtime
 	select BR2_PACKAGE_PERL_TIME_PARSEDATE # runtime
 	help
-	  creates a server used to receive events from an x10 client
+	  creates a server used to receive events from an x10 client.
 
 	  https://metacpan.org/release/X10
 
diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
index 0e4169867f..ce0a4783d8 100644
--- a/package/perl-xml-libxml/Config.in
+++ b/package/perl-xml-libxml/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PERL_XML_LIBXML
 	select BR2_PACKAGE_PERL_XML_SAX # runtime
 	select BR2_PACKAGE_PERL_XML_SAX_BASE # runtime
 	help
-	  Interface to Gnome libxml2 xml parsing and DOM library
+	  Interface to Gnome libxml2 xml parsing and DOM library.
 
 	  https://github.com/shlomif/perl-XML-LibXML
 
diff --git a/package/perl-xml-namespacesupport/Config.in b/package/perl-xml-namespacesupport/Config.in
index 93a697c624..dc1034d383 100644
--- a/package/perl-xml-namespacesupport/Config.in
+++ b/package/perl-xml-namespacesupport/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
 	bool "perl-xml-namespacesupport"
 	help
-	  A simple generic namespace processor
+	  A simple generic namespace processor.
 
 	  https://github.com/perigrin/xml-namespacesupport
diff --git a/package/perl-xml-sax-base/Config.in b/package/perl-xml-sax-base/Config.in
index 2ad25ac39b..03b344d20f 100644
--- a/package/perl-xml-sax-base/Config.in
+++ b/package/perl-xml-sax-base/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_XML_SAX_BASE
 	bool "perl-xml-sax-base"
 	help
-	  Base class for SAX Drivers and Filters
+	  Base class for SAX Drivers and Filters.
 
 	  https://metacpan.org/release/XML-SAX-Base
diff --git a/package/perl-xml-sax/Config.in b/package/perl-xml-sax/Config.in
index cf89c21be3..4e603f3a98 100644
--- a/package/perl-xml-sax/Config.in
+++ b/package/perl-xml-sax/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_XML_SAX
 	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT # runtime
 	select BR2_PACKAGE_PERL_XML_SAX_BASE # runtime
 	help
-	  Simple API for XML
+	  Simple API for XML.
 
 	  https://metacpan.org/release/XML-SAX
