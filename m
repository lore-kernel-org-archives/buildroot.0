From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:06:28 +0200
Subject: [Buildroot] [git commit] perl-*: regeneration of Config.in files
Message-ID: <20181010070555.DFDD381E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5b2a50762f0fd47ba4a1257fe6e192037c091b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-appconfig/Config.in             | 3 ++-
 package/perl-convert-asn1/Config.in          | 3 ++-
 package/perl-crypt-openssl-random/Config.in  | 2 +-
 package/perl-crypt-openssl-rsa/Config.in     | 2 +-
 package/perl-digest-hmac/Config.in           | 4 ++--
 package/perl-encode-detect/Config.in         | 2 +-
 package/perl-encode-locale/Config.in         | 2 +-
 package/perl-file-listing/Config.in          | 4 ++--
 package/perl-html-tagset/Config.in           | 4 ++--
 package/perl-http-daemon/Config.in           | 5 ++---
 package/perl-http-date/Config.in             | 5 ++---
 package/perl-http-negotiate/Config.in        | 6 ++----
 package/perl-io-html/Config.in               | 5 ++---
 package/perl-lwp-mediatypes/Config.in        | 5 ++---
 package/perl-mime-base64/Config.in           | 5 ++---
 package/perl-module-implementation/Config.in | 4 ++--
 package/perl-timedate/Config.in              | 2 +-
 package/perl-www-robotrules/Config.in        | 5 ++---
 18 files changed, 31 insertions(+), 37 deletions(-)

diff --git a/package/perl-appconfig/Config.in b/package/perl-appconfig/Config.in
index 0c40abb9ef..f89bf06c27 100644
--- a/package/perl-appconfig/Config.in
+++ b/package/perl-appconfig/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_APPCONFIG
 	bool "perl-appconfig"
 	help
 	  AppConfig is a bundle of Perl5 modules for reading
-	  configuration files and parsing command line arguments.
+	  configuration files and parsing command line
+	  arguments.
 
 	  https://metacpan.org/release/AppConfig
diff --git a/package/perl-convert-asn1/Config.in b/package/perl-convert-asn1/Config.in
index a3e988c888..2fb08fa040 100644
--- a/package/perl-convert-asn1/Config.in
+++ b/package/perl-convert-asn1/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CONVERT_ASN1
 	bool "perl-convert-asn1"
 	help
-	  Convert between perl data structures and ASN.1 encoded packets
+	  Convert between perl data structures and ASN.1 encoded
+	  packets
 
 	  https://metacpan.org/release/Convert-ASN1
diff --git a/package/perl-crypt-openssl-random/Config.in b/package/perl-crypt-openssl-random/Config.in
index 2ceb78dfd6..480e5158ff 100644
--- a/package/perl-crypt-openssl-random/Config.in
+++ b/package/perl-crypt-openssl-random/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	help
 	  OpenSSL/LibreSSL pseudo-random number generator access
 
-	  http://sourceforge.net/projects/perl-openssl/
+	  https://metacpan.org/release/Crypt-OpenSSL-Random
 
 comment "perl-crypt-openssl-random needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index 1fa1fd9881..fe2e0cf59e 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	help
 	  RSA encoding and decoding, using the openSSL libraries
 
-	  https://metacpan.org/release/Crypt-OpenSSL-RSA
+	  http://github.com/toddr/Crypt-OpenSSL-RSA
 
 comment "perl-crypt-openssl-rsa needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-digest-hmac/Config.in b/package/perl-digest-hmac/Config.in
index 733a53d8ae..91b1b94f49 100644
--- a/package/perl-digest-hmac/Config.in
+++ b/package/perl-digest-hmac/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DIGEST_HMAC
 	bool "perl-digest-hmac"
 	help
-	  Digest::HMAC - Keyed-Hashing for Message Authentication
+	  Keyed-Hashing for Message Authentication
 
-	  https://github.com/gisle/digest-hmac
+	  https://metacpan.org/release/Digest-HMAC
diff --git a/package/perl-encode-detect/Config.in b/package/perl-encode-detect/Config.in
index 63ea432917..62e1baa7ca 100644
--- a/package/perl-encode-detect/Config.in
+++ b/package/perl-encode-detect/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_ENCODE_DETECT
 	depends on !BR2_STATIC_LIBS
 	help
 	  An Encode::Encoding subclass that detects the encoding of
-	  data.
+	  data
 
 	  https://metacpan.org/release/Encode-Detect
 
diff --git a/package/perl-encode-locale/Config.in b/package/perl-encode-locale/Config.in
index d15aecbdfa..b580f64760 100644
--- a/package/perl-encode-locale/Config.in
+++ b/package/perl-encode-locale/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_ENCODE_LOCALE
 	help
 	  Determine the locale encoding
 
-	  https://github.com/gisle/encode-locale
+	  https://metacpan.org/release/Encode-Locale
diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
index 85f8e2eb1d..3cb1996772 100644
--- a/package/perl-file-listing/Config.in
+++ b/package/perl-file-listing/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_FILE_LISTING
 	bool "perl-file-listing"
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	help
-	  Module to parse directoy listings
+	  parse directory listing
 
-	  https://github.com/gisle/file-listing
+	  https://metacpan.org/release/File-Listing
diff --git a/package/perl-html-tagset/Config.in b/package/perl-html-tagset/Config.in
index a39bc651f2..7e3b33dfb3 100644
--- a/package/perl-html-tagset/Config.in
+++ b/package/perl-html-tagset/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HTML_TAGSET
 	bool "perl-html-tagset"
 	help
-	  HTML::Tagset - data tables useful in parsing HTML
+	  data tables useful in parsing HTML
 
-	  http://www.cpan.org/modules/by-authors/id/P/PE/PETDANCE/
+	  https://metacpan.org/release/HTML-Tagset
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index 7544ece1ae..b5ed5a4180 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PERL_HTTP_DAEMON
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	help
-	  Instances of the `HTTP::Daemon' class are HTTP/1.1 servers
-	  that listen on a socket for incoming requests.
+	  a simple http server class
 
-	  http://github.com/gisle/http-daemon
+	  https://metacpan.org/release/HTTP-Daemon
diff --git a/package/perl-http-date/Config.in b/package/perl-http-date/Config.in
index 5ce4781394..4d7b4d18d4 100644
--- a/package/perl-http-date/Config.in
+++ b/package/perl-http-date/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_DATE
 	bool "perl-http-date"
 	help
-	  This module provides functions that deal the date formats
-	  used by the HTTP protocol (and then some more)
+	  date conversion routines
 
-	  https://github.com/gisle/http-date
+	  https://metacpan.org/release/HTTP-Date
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index dcb1bbbfb9..449b0861a5 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	help
-	  This module provides a complete implementation of the HTTP
-	  content negotiation algorithm specified in
-	  draft-ietf-http-v11-spec-00.ps chapter 12.
+	  choose a variant to serve
 
-	  http://github.com/gisle/http-negotiate
+	  https://metacpan.org/release/HTTP-Negotiate
diff --git a/package/perl-io-html/Config.in b/package/perl-io-html/Config.in
index 86038af007..fe67c63d07 100644
--- a/package/perl-io-html/Config.in
+++ b/package/perl-io-html/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERL_IO_HTML
 	bool "perl-io-html"
 	help
-	  Perl module that opens a file and performs automatic charset
-	  detection
+	  Open an HTML file with automatic charset detection
 
-	  https://github.com/madsen/io-html
+	  https://metacpan.org/release/IO-HTML
diff --git a/package/perl-lwp-mediatypes/Config.in b/package/perl-lwp-mediatypes/Config.in
index ae2056adef..9b6538776d 100644
--- a/package/perl-lwp-mediatypes/Config.in
+++ b/package/perl-lwp-mediatypes/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	bool "perl-lwp-mediatypes"
 	help
-	  This module provides functions for handling media (also
-	  known as MIME) types and encodings.
+	  guess media type for a file or a URL
 
-	  https://github.com/gisle/lwp-mediatypes
+	  https://metacpan.org/release/LWP-MediaTypes
diff --git a/package/perl-mime-base64/Config.in b/package/perl-mime-base64/Config.in
index 702259853a..b1d9aa5215 100644
--- a/package/perl-mime-base64/Config.in
+++ b/package/perl-mime-base64/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_PERL_MIME_BASE64
 	bool "perl-mime-base64"
 	depends on !BR2_STATIC_LIBS
 	help
-	  This package contains a base64 encoder/decoder and a
-	  quoted-printable encoder/decoder.
+	  The RFC 2045 encodings; base64 and quoted-printable
 
-	  http://github.com/gisle/mime-base64
+	  https://metacpan.org/release/MIME-Base64
 
 comment "perl-mime-base64 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-module-implementation/Config.in b/package/perl-module-implementation/Config.in
index 354197649d..d7c526cec2 100644
--- a/package/perl-module-implementation/Config.in
+++ b/package/perl-module-implementation/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
 	select BR2_PACKAGE_PERL_MODULE_RUNTIME
 	select BR2_PACKAGE_PERL_TRY_TINY
 	help
-	  Loads one of several alternate underlying implementations
-	  for a module
+	  Loads one of several alternate underlying implementations for
+	  a module
 
 	  http://metacpan.org/release/Module-Implementation
diff --git a/package/perl-timedate/Config.in b/package/perl-timedate/Config.in
index 7ce9de1a7d..ee6d6692b0 100644
--- a/package/perl-timedate/Config.in
+++ b/package/perl-timedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIMEDATE
 	bool "perl-timedate"
 	help
-	  Date formating subroutines
+	  miscellaneous timezone manipulations routines
 
 	  https://metacpan.org/release/TimeDate
diff --git a/package/perl-www-robotrules/Config.in b/package/perl-www-robotrules/Config.in
index 3e7175e331..f43d2904d1 100644
--- a/package/perl-www-robotrules/Config.in
+++ b/package/perl-www-robotrules/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PERL_WWW_ROBOTRULES
 	bool "perl-www-robotrules"
 	select BR2_PACKAGE_PERL_URI
 	help
-	  This module provides functions that deal the date formats
-	  used by the HTTP protocol (and then some more)
+	  database of robots.txt-derived permissions
 
-	  http://github.com/gisle/www-robotrules
+	  https://metacpan.org/release/WWW-RobotRules
