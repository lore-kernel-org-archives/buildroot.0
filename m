From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:33:49 +0100
Subject: [Buildroot] [git commit] perl-*: regenerate with _DISTNAME
Message-ID: <20181023234600.943FD837AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11cae5b1ae8307e4b473f18451b8d12249a048d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk    | 1 +
 package/perl-appconfig/perl-appconfig.mk                                | 1 +
 package/perl-astro-suntime/perl-astro-suntime.mk                        | 1 +
 package/perl-class-inspector/perl-class-inspector.mk                    | 1 +
 package/perl-class-load/perl-class-load.mk                              | 1 +
 package/perl-class-method-modifiers/perl-class-method-modifiers.mk      | 1 +
 package/perl-class-std-fast/perl-class-std-fast.mk                      | 1 +
 package/perl-class-std/perl-class-std.mk                                | 1 +
 package/perl-convert-asn1/perl-convert-asn1.mk                          | 1 +
 package/perl-cookie-baker/perl-cookie-baker.mk                          | 1 +
 package/perl-crypt-blowfish/perl-crypt-blowfish.mk                      | 1 +
 package/perl-crypt-cbc/perl-crypt-cbc.mk                                | 1 +
 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk            | 1 +
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk          | 1 +
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk                | 1 +
 package/perl-data-dump/perl-data-dump.mk                                | 1 +
 package/perl-data-optlist/perl-data-optlist.mk                          | 1 +
 package/perl-data-uuid/perl-data-uuid.mk                                | 1 +
 package/perl-date-manip/perl-date-manip.mk                              | 1 +
 package/perl-datetime-tiny/perl-datetime-tiny.mk                        | 1 +
 package/perl-dbd-mysql/perl-dbd-mysql.mk                                | 2 ++
 package/perl-dbi/perl-dbi.mk                                            | 1 +
 package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk    | 1 +
 package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk    | 1 +
 package/perl-devel-stacktrace/perl-devel-stacktrace.mk                  | 1 +
 package/perl-device-serialport/perl-device-serialport.mk                | 1 +
 package/perl-digest-hmac/perl-digest-hmac.mk                            | 1 +
 package/perl-digest-md5/perl-digest-md5.mk                              | 1 +
 package/perl-digest-sha1/perl-digest-sha1.mk                            | 1 +
 package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk            | 1 +
 package/perl-encode-detect/perl-encode-detect.mk                        | 1 +
 package/perl-encode-locale/perl-encode-locale.mk                        | 1 +
 package/perl-exporter-tiny/perl-exporter-tiny.mk                        | 1 +
 package/perl-extutils-config/perl-extutils-config.mk                    | 1 +
 package/perl-extutils-helpers/perl-extutils-helpers.mk                  | 1 +
 package/perl-extutils-installpaths/perl-extutils-installpaths.mk        | 1 +
 package/perl-file-listing/perl-file-listing.mk                          | 1 +
 package/perl-file-sharedir-install/perl-file-sharedir-install.mk        | 1 +
 package/perl-file-sharedir/perl-file-sharedir.mk                        | 1 +
 package/perl-file-slurp/perl-file-slurp.mk                              | 1 +
 package/perl-file-util/perl-file-util.mk                                | 1 +
 package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk        | 1 +
 package/perl-gd/perl-gd.mk                                              | 1 +
 package/perl-gdgraph/perl-gdgraph.mk                                    | 1 +
 package/perl-gdtextutil/perl-gdtextutil.mk                              | 1 +
 package/perl-hash-multivalue/perl-hash-multivalue.mk                    | 1 +
 package/perl-html-parser/perl-html-parser.mk                            | 1 +
 package/perl-html-tagset/perl-html-tagset.mk                            | 1 +
 package/perl-http-cookies/perl-http-cookies.mk                          | 1 +
 package/perl-http-daemon/perl-http-daemon.mk                            | 1 +
 package/perl-http-date/perl-http-date.mk                                | 1 +
 package/perl-http-entity-parser/perl-http-entity-parser.mk              | 1 +
 package/perl-http-headers-fast/perl-http-headers-fast.mk                | 1 +
 package/perl-http-message/perl-http-message.mk                          | 1 +
 package/perl-http-multipartparser/perl-http-multipartparser.mk          | 1 +
 package/perl-http-negotiate/perl-http-negotiate.mk                      | 1 +
 package/perl-io-html/perl-io-html.mk                                    | 1 +
 package/perl-io-interface/perl-io-interface.mk                          | 1 +
 package/perl-io-socket-multicast/perl-io-socket-multicast.mk            | 1 +
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk                        | 1 +
 package/perl-json-maybexs/perl-json-maybexs.mk                          | 1 +
 package/perl-json-tiny/perl-json-tiny.mk                                | 1 +
 package/perl-libwww-perl/perl-libwww-perl.mk                            | 1 +
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk                      | 1 +
 package/perl-mail-dkim/perl-mail-dkim.mk                                | 1 +
 package/perl-mailtools/perl-mailtools.mk                                | 1 +
 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk            | 1 +
 package/perl-mime-base64/perl-mime-base64.mk                            | 1 +
 package/perl-mime-tools/perl-mime-tools.mk                              | 1 +
 package/perl-module-build-tiny/perl-module-build-tiny.mk                | 1 +
 package/perl-module-build/perl-module-build.mk                          | 1 +
 package/perl-module-implementation/perl-module-implementation.mk        | 1 +
 package/perl-module-runtime/perl-module-runtime.mk                      | 1 +
 .../perl-mojolicious-plugin-authentication.mk                           | 1 +
 package/perl-mojolicious/perl-mojolicious.mk                            | 1 +
 package/perl-moo/perl-moo.mk                                            | 1 +
 package/perl-net-dns/perl-net-dns.mk                                    | 1 +
 package/perl-net-http/perl-net-http.mk                                  | 1 +
 package/perl-net-ping/perl-net-ping.mk                                  | 1 +
 package/perl-net-snmp/perl-net-snmp.mk                                  | 1 +
 package/perl-net-ssh2/perl-net-ssh2.mk                                  | 2 ++
 package/perl-net-ssleay/perl-net-ssleay.mk                              | 1 +
 package/perl-net-telnet/perl-net-telnet.mk                              | 1 +
 package/perl-netaddr-ip/perl-netaddr-ip.mk                              | 1 +
 package/perl-number-bytes-human/perl-number-bytes-human.mk              | 1 +
 package/perl-package-stash/perl-package-stash.mk                        | 1 +
 package/perl-params-util/perl-params-util.mk                            | 1 +
 package/perl-path-tiny/perl-path-tiny.mk                                | 1 +
 package/perl-plack/perl-plack.mk                                        | 1 +
 package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk    | 1 +
 package/perl-role-tiny/perl-role-tiny.mk                                | 1 +
 package/perl-stream-buffered/perl-stream-buffered.mk                    | 1 +
 package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk  | 1 +
 package/perl-sub-install/perl-sub-install.mk                            | 1 +
 package/perl-sub-quote/perl-sub-quote.mk                                | 1 +
 package/perl-sys-meminfo/perl-sys-meminfo.mk                            | 1 +
 package/perl-sys-mmap/perl-sys-mmap.mk                                  | 1 +
 package/perl-time-hires/perl-time-hires.mk                              | 1 +
 package/perl-time-parsedate/perl-time-parsedate.mk                      | 1 +
 package/perl-timedate/perl-timedate.mk                                  | 1 +
 package/perl-try-tiny/perl-try-tiny.mk                                  | 1 +
 package/perl-type-tiny/perl-type-tiny.mk                                | 1 +
 package/perl-uri/perl-uri.mk                                            | 1 +
 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk            | 1 +
 package/perl-www-robotrules/perl-www-robotrules.mk                      | 1 +
 package/perl-x10/perl-x10.mk                                            | 1 +
 package/perl-xml-libxml/perl-xml-libxml.mk                              | 1 +
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk          | 1 +
 package/perl-xml-sax-base/perl-xml-sax-base.mk                          | 1 +
 package/perl-xml-sax/perl-xml-sax.mk                                    | 1 +
 110 files changed, 112 insertions(+)

diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
index a25c71793d..59290f376e 100644
--- a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
@@ -10,5 +10,6 @@ PERL_APACHE_LOGFORMAT_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBUR
 PERL_APACHE_LOGFORMAT_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_APACHE_LOGFORMAT_COMPILER_LICENSE = Artistic or GPL-1.0+
 PERL_APACHE_LOGFORMAT_COMPILER_LICENSE_FILES = LICENSE
+PERL_APACHE_LOGFORMAT_COMPILER_DISTNAME = Apache-LogFormat-Compiler
 
 $(eval $(perl-package))
diff --git a/package/perl-appconfig/perl-appconfig.mk b/package/perl-appconfig/perl-appconfig.mk
index 7a553e330b..8f9dd52021 100644
--- a/package/perl-appconfig/perl-appconfig.mk
+++ b/package/perl-appconfig/perl-appconfig.mk
@@ -9,5 +9,6 @@ PERL_APPCONFIG_SOURCE = AppConfig-$(PERL_APPCONFIG_VERSION).tar.gz
 PERL_APPCONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NE/NEILB
 PERL_APPCONFIG_LICENSE = Artistic or GPL-1.0+
 PERL_APPCONFIG_LICENSE_FILES = LICENSE
+PERL_APPCONFIG_DISTNAME = AppConfig
 
 $(eval $(perl-package))
diff --git a/package/perl-astro-suntime/perl-astro-suntime.mk b/package/perl-astro-suntime/perl-astro-suntime.mk
index 3bd421eec5..e5cad6a409 100644
--- a/package/perl-astro-suntime/perl-astro-suntime.mk
+++ b/package/perl-astro-suntime/perl-astro-suntime.mk
@@ -10,5 +10,6 @@ PERL_ASTRO_SUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
 PERL_ASTRO_SUNTIME_DEPENDENCIES = host-perl-module-build
 PERL_ASTRO_SUNTIME_LICENSE = GPL-3.0
 PERL_ASTRO_SUNTIME_LICENSE_FILES = LICENSE
+PERL_ASTRO_SUNTIME_DISTNAME = Astro-SunTime
 
 $(eval $(perl-package))
diff --git a/package/perl-class-inspector/perl-class-inspector.mk b/package/perl-class-inspector/perl-class-inspector.mk
index 5aee572571..c265194f12 100644
--- a/package/perl-class-inspector/perl-class-inspector.mk
+++ b/package/perl-class-inspector/perl-class-inspector.mk
@@ -9,5 +9,6 @@ PERL_CLASS_INSPECTOR_SOURCE = Class-Inspector-$(PERL_CLASS_INSPECTOR_VERSION).ta
 PERL_CLASS_INSPECTOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_CLASS_INSPECTOR_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_INSPECTOR_LICENSE_FILES = LICENSE
+PERL_CLASS_INSPECTOR_DISTNAME = Class-Inspector
 
 $(eval $(perl-package))
diff --git a/package/perl-class-load/perl-class-load.mk b/package/perl-class-load/perl-class-load.mk
index 199a3c2ebd..c18e53d199 100644
--- a/package/perl-class-load/perl-class-load.mk
+++ b/package/perl-class-load/perl-class-load.mk
@@ -9,5 +9,6 @@ PERL_CLASS_LOAD_SOURCE = Class-Load-$(PERL_CLASS_LOAD_VERSION).tar.gz
 PERL_CLASS_LOAD_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_CLASS_LOAD_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_LOAD_LICENSE_FILES = LICENSE
+PERL_CLASS_LOAD_DISTNAME = Class-Load
 
 $(eval $(perl-package))
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
index 725b70a74b..e93553f964 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -9,5 +9,6 @@ PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_
 PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_METHOD_MODIFIERS_LICENSE_FILES = LICENSE
+PERL_CLASS_METHOD_MODIFIERS_DISTNAME = Class-Method-Modifiers
 
 $(eval $(perl-package))
diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index 5986359cff..57e57b1954 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -10,5 +10,6 @@ PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
 PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_FAST_LICENSE_FILES = README
+PERL_CLASS_STD_FAST_DISTNAME = Class-Std-Fast
 
 $(eval $(perl-package))
diff --git a/package/perl-class-std/perl-class-std.mk b/package/perl-class-std/perl-class-std.mk
index 2e3ba95a8b..493a89f26b 100644
--- a/package/perl-class-std/perl-class-std.mk
+++ b/package/perl-class-std/perl-class-std.mk
@@ -10,5 +10,6 @@ PERL_CLASS_STD_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHORNY
 PERL_CLASS_STD_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_LICENSE_FILES = README
+PERL_CLASS_STD_DISTNAME = Class-Std
 
 $(eval $(perl-package))
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index 74482010f9..b6ba76a7e8 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -9,5 +9,6 @@ PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
 PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
 PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
 PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
+PERL_CONVERT_ASN1_DISTNAME = Convert-ASN1
 
 $(eval $(perl-package))
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
index 3dd02869d2..45ecdc96c1 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.mk
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -10,5 +10,6 @@ PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_COOKIE_BAKER_LICENSE = Artistic or GPL-1.0+
 PERL_COOKIE_BAKER_LICENSE_FILES = LICENSE
+PERL_COOKIE_BAKER_DISTNAME = Cookie-Baker
 
 $(eval $(perl-package))
diff --git a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
index acb6d8af1d..a8f274b601 100644
--- a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
+++ b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
@@ -9,5 +9,6 @@ PERL_CRYPT_BLOWFISH_SOURCE = Crypt-Blowfish-$(PERL_CRYPT_BLOWFISH_VERSION).tar.g
 PERL_CRYPT_BLOWFISH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DP/DPARIS
 PERL_CRYPT_BLOWFISH_LICENSE = BSD-4-Clause-like
 PERL_CRYPT_BLOWFISH_LICENSE_FILES = COPYRIGHT
+PERL_CRYPT_BLOWFISH_DISTNAME = Crypt-Blowfish
 
 $(eval $(perl-package))
diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.mk b/package/perl-crypt-cbc/perl-crypt-cbc.mk
index 749499c26b..c00ec37eea 100644
--- a/package/perl-crypt-cbc/perl-crypt-cbc.mk
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.mk
@@ -9,5 +9,6 @@ PERL_CRYPT_CBC_SOURCE = Crypt-CBC-$(PERL_CRYPT_CBC_VERSION).tar.gz
 PERL_CRYPT_CBC_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
 PERL_CRYPT_CBC_LICENSE = Artistic
 PERL_CRYPT_CBC_LICENSE_FILES = CBC.pm
+PERL_CRYPT_CBC_DISTNAME = Crypt-CBC
 
 $(eval $(perl-package))
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
index 69d7a0ef8f..a53285165b 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -9,5 +9,6 @@ PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS
 PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
 PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_GUESS_LICENSE_FILES = LICENSE
+PERL_CRYPT_OPENSSL_GUESS_DISTNAME = Crypt-OpenSSL-Guess
 
 $(eval $(host-perl-package))
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index 1e1d7c1112..e70eb7e927 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -12,6 +12,7 @@ PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = \
 	openssl
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
+PERL_CRYPT_OPENSSL_RANDOM_DISTNAME = Crypt-OpenSSL-Random
 
 # Try as hard as possible to remedy to the brain-damage their build-system
 # suffers from: don't search for openssl, they pick the host-system one.
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index 790af760c7..0edcb22361 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -12,6 +12,7 @@ PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
 	perl-crypt-openssl-random
 PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
+PERL_CRYPT_OPENSSL_RSA_DISTNAME = Crypt-OpenSSL-RSA
 
 # Try as hard as possible to remedy to the brain-damage their build-system
 # suffers from: don't search for openssl, they pick the host-system one.
diff --git a/package/perl-data-dump/perl-data-dump.mk b/package/perl-data-dump/perl-data-dump.mk
index 7c5d46e08e..54d3a925fe 100644
--- a/package/perl-data-dump/perl-data-dump.mk
+++ b/package/perl-data-dump/perl-data-dump.mk
@@ -9,5 +9,6 @@ PERL_DATA_DUMP_SOURCE = Data-Dump-$(PERL_DATA_DUMP_VERSION).tar.gz
 PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_DATA_DUMP_LICENSE = Artistic or GPL-1.0+
 PERL_DATA_DUMP_LICENSE_FILES = README
+PERL_DATA_DUMP_DISTNAME = Data-Dump
 
 $(eval $(perl-package))
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 523857cc66..49aeb820e2 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -9,5 +9,6 @@ PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
 PERL_DATA_OPTLIST_LICENSE_FILES = LICENSE
+PERL_DATA_OPTLIST_DISTNAME = Data-OptList
 
 $(eval $(perl-package))
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
index 8e612913d9..6ce3939603 100644
--- a/package/perl-data-uuid/perl-data-uuid.mk
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -14,5 +14,6 @@ PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 # do the same here.
 PERL_DATA_UUID_LICENSE = MIT-HP
 PERL_DATA_UUID_LICENSE_FILES = LICENSE
+PERL_DATA_UUID_DISTNAME = Data-UUID
 
 $(eval $(perl-package))
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index a5e1609a88..08d85f2d4a 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -9,5 +9,6 @@ PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
 PERL_DATE_MANIP_LICENSE_FILES = LICENSE
+PERL_DATE_MANIP_DISTNAME = Date-Manip
 
 $(eval $(perl-package))
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index e8ee3d60e2..2a4264261e 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -9,5 +9,6 @@ PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_DATETIME_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
+PERL_DATETIME_TINY_DISTNAME = DateTime-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
index 06a1a115a4..98521a78cf 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.mk
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
@@ -12,6 +12,8 @@ PERL_DBD_MYSQL_DEPENDENCIES = \
 	mysql
 PERL_DBD_MYSQL_LICENSE = Artistic or GPL-1.0+
 PERL_DBD_MYSQL_LICENSE_FILES = LICENSE
+PERL_DBD_MYSQL_DISTNAME = DBD-mysql
+
 PERL_DBD_MYSQL_CONF_OPTS = --mysql_config=$(STAGING_DIR)/usr/bin/mysql_config
 
 $(eval $(perl-package))
diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
index 4ee9149f1f..835e8bdfe3 100644
--- a/package/perl-dbi/perl-dbi.mk
+++ b/package/perl-dbi/perl-dbi.mk
@@ -9,6 +9,7 @@ PERL_DBI_SOURCE = DBI-$(PERL_DBI_VERSION).tar.gz
 PERL_DBI_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMB
 PERL_DBI_LICENSE = Artistic or GPL-1.0+
 PERL_DBI_LICENSE_FILES = LICENSE
+PERL_DBI_DISTNAME = DBI
 
 $(eval $(perl-package))
 $(eval $(host-perl-package))
diff --git a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
index 95155b6766..3d4d60ed23 100644
--- a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
+++ b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
@@ -9,5 +9,6 @@ PERL_DEVEL_GLOBALDESTRUCTION_SOURCE = Devel-GlobalDestruction-$(PERL_DEVEL_GLOBA
 PERL_DEVEL_GLOBALDESTRUCTION_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_DEVEL_GLOBALDESTRUCTION_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_GLOBALDESTRUCTION_LICENSE_FILES = README
+PERL_DEVEL_GLOBALDESTRUCTION_DISTNAME = Devel-GlobalDestruction
 
 $(eval $(perl-package))
diff --git a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
index bebe486b5c..949823c024 100644
--- a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
+++ b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
@@ -9,5 +9,6 @@ PERL_DEVEL_STACKTRACE_ASHTML_SOURCE = Devel-StackTrace-AsHTML-$(PERL_DEVEL_STACK
 PERL_DEVEL_STACKTRACE_ASHTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_DEVEL_STACKTRACE_ASHTML_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_STACKTRACE_ASHTML_LICENSE_FILES = LICENSE
+PERL_DEVEL_STACKTRACE_ASHTML_DISTNAME = Devel-StackTrace-AsHTML
 
 $(eval $(perl-package))
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
index da51fb6c19..1d3ec98ec3 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
@@ -9,5 +9,6 @@ PERL_DEVEL_STACKTRACE_SOURCE = Devel-StackTrace-$(PERL_DEVEL_STACKTRACE_VERSION)
 PERL_DEVEL_STACKTRACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
 PERL_DEVEL_STACKTRACE_LICENSE = Artistic-2.0
 PERL_DEVEL_STACKTRACE_LICENSE_FILES = LICENSE
+PERL_DEVEL_STACKTRACE_DISTNAME = Devel-StackTrace
 
 $(eval $(perl-package))
diff --git a/package/perl-device-serialport/perl-device-serialport.mk b/package/perl-device-serialport/perl-device-serialport.mk
index d9c61e9486..9889c91321 100644
--- a/package/perl-device-serialport/perl-device-serialport.mk
+++ b/package/perl-device-serialport/perl-device-serialport.mk
@@ -9,5 +9,6 @@ PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSI
 PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
 PERL_DEVICE_SERIALPORT_LICENSE = Artistic or GPL-1.0+
 PERL_DEVICE_SERIALPORT_LICENSE_FILES = README
+PERL_DEVICE_SERIALPORT_DISTNAME = Device-SerialPort
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index a926a1e5c0..daacf7dab4 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -9,5 +9,6 @@ PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
 PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_DIGEST_HMAC_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_HMAC_LICENSE_FILES = README
+PERL_DIGEST_HMAC_DISTNAME = Digest-HMAC
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-md5/perl-digest-md5.mk b/package/perl-digest-md5/perl-digest-md5.mk
index f39f4b2323..19c89d95ac 100644
--- a/package/perl-digest-md5/perl-digest-md5.mk
+++ b/package/perl-digest-md5/perl-digest-md5.mk
@@ -9,5 +9,6 @@ PERL_DIGEST_MD5_SOURCE = Digest-MD5-$(PERL_DIGEST_MD5_VERSION).tar.gz
 PERL_DIGEST_MD5_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_DIGEST_MD5_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_MD5_LICENSE_FILES = README
+PERL_DIGEST_MD5_DISTNAME = Digest-MD5
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-sha1/perl-digest-sha1.mk b/package/perl-digest-sha1/perl-digest-sha1.mk
index d93159b94e..d3188db14e 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.mk
+++ b/package/perl-digest-sha1/perl-digest-sha1.mk
@@ -9,5 +9,6 @@ PERL_DIGEST_SHA1_SOURCE = Digest-SHA1-$(PERL_DIGEST_SHA1_VERSION).tar.gz
 PERL_DIGEST_SHA1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_DIGEST_SHA1_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_SHA1_LICENSE_FILES = README
+PERL_DIGEST_SHA1_DISTNAME = Digest-SHA1
 
 $(eval $(perl-package))
diff --git a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
index 9bccf2bb44..47bd19f6ca 100644
--- a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
+++ b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
@@ -9,5 +9,6 @@ PERL_DIST_CHECKCONFLICTS_SOURCE = Dist-CheckConflicts-$(PERL_DIST_CHECKCONFLICTS
 PERL_DIST_CHECKCONFLICTS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
 PERL_DIST_CHECKCONFLICTS_LICENSE = Artistic or GPL-1.0+
 PERL_DIST_CHECKCONFLICTS_LICENSE_FILES = LICENSE
+PERL_DIST_CHECKCONFLICTS_DISTNAME = Dist-CheckConflicts
 
 $(eval $(perl-package))
diff --git a/package/perl-encode-detect/perl-encode-detect.mk b/package/perl-encode-detect/perl-encode-detect.mk
index 732fba8db5..8e9ea77968 100644
--- a/package/perl-encode-detect/perl-encode-detect.mk
+++ b/package/perl-encode-detect/perl-encode-detect.mk
@@ -10,5 +10,6 @@ PERL_ENCODE_DETECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JG/JGMYERS
 PERL_ENCODE_DETECT_DEPENDENCIES = host-perl-module-build
 PERL_ENCODE_DETECT_LICENSE = MPL-1.1
 PERL_ENCODE_DETECT_LICENSE_FILES = LICENSE
+PERL_ENCODE_DETECT_DISTNAME = Encode-Detect
 
 $(eval $(perl-package))
diff --git a/package/perl-encode-locale/perl-encode-locale.mk b/package/perl-encode-locale/perl-encode-locale.mk
index 80d9c3b5fc..1e948c65e1 100644
--- a/package/perl-encode-locale/perl-encode-locale.mk
+++ b/package/perl-encode-locale/perl-encode-locale.mk
@@ -9,5 +9,6 @@ PERL_ENCODE_LOCALE_SOURCE = Encode-Locale-$(PERL_ENCODE_LOCALE_VERSION).tar.gz
 PERL_ENCODE_LOCALE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_ENCODE_LOCALE_LICENSE = Artistic or GPL-1.0+
 PERL_ENCODE_LOCALE_LICENSE_FILES = README
+PERL_ENCODE_LOCALE_DISTNAME = Encode-Locale
 
 $(eval $(perl-package))
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 374abd6f1b..1ba1a5ac70 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -9,5 +9,6 @@ PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_EXPORTER_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+PERL_EXPORTER_TINY_DISTNAME = Exporter-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-extutils-config/perl-extutils-config.mk b/package/perl-extutils-config/perl-extutils-config.mk
index dfb8b26da7..f46ca3e6fd 100644
--- a/package/perl-extutils-config/perl-extutils-config.mk
+++ b/package/perl-extutils-config/perl-extutils-config.mk
@@ -9,5 +9,6 @@ PERL_EXTUTILS_CONFIG_SOURCE = ExtUtils-Config-$(PERL_EXTUTILS_CONFIG_VERSION).ta
 PERL_EXTUTILS_CONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_EXTUTILS_CONFIG_LICENSE = Artistic or GPL-1.0+
 PERL_EXTUTILS_CONFIG_LICENSE_FILES = LICENSE
+PERL_EXTUTILS_CONFIG_DISTNAME = ExtUtils-Config
 
 $(eval $(host-perl-package))
diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.mk b/package/perl-extutils-helpers/perl-extutils-helpers.mk
index 82f34925fa..d3b14d88ce 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.mk
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.mk
@@ -9,5 +9,6 @@ PERL_EXTUTILS_HELPERS_SOURCE = ExtUtils-Helpers-$(PERL_EXTUTILS_HELPERS_VERSION)
 PERL_EXTUTILS_HELPERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_EXTUTILS_HELPERS_LICENSE = Artistic or GPL-1.0+
 PERL_EXTUTILS_HELPERS_LICENSE_FILES = LICENSE
+PERL_EXTUTILS_HELPERS_DISTNAME = ExtUtils-Helpers
 
 $(eval $(host-perl-package))
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index 75b4c5f235..e90e130c36 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -10,5 +10,6 @@ PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
 PERL_EXTUTILS_INSTALLPATHS_LICENSE = Artistic or GPL-1.0+
 PERL_EXTUTILS_INSTALLPATHS_LICENSE_FILES = LICENSE
+PERL_EXTUTILS_INSTALLPATHS_DISTNAME = ExtUtils-InstallPaths
 
 $(eval $(host-perl-package))
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index 54d9370c50..9f3ca95164 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -9,5 +9,6 @@ PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_LISTING_LICENSE_FILES = README
+PERL_FILE_LISTING_DISTNAME = File-Listing
 
 $(eval $(perl-package))
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
index 9b79b9fd17..3653a4bade 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
@@ -9,5 +9,6 @@ PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_I
 PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SHAREDIR_INSTALL_LICENSE_FILES = LICENSE
+PERL_FILE_SHAREDIR_INSTALL_DISTNAME = File-ShareDir-Install
 
 $(eval $(host-perl-package))
diff --git a/package/perl-file-sharedir/perl-file-sharedir.mk b/package/perl-file-sharedir/perl-file-sharedir.mk
index fb868161a3..d907f3b066 100644
--- a/package/perl-file-sharedir/perl-file-sharedir.mk
+++ b/package/perl-file-sharedir/perl-file-sharedir.mk
@@ -10,5 +10,6 @@ PERL_FILE_SHAREDIR_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
 PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-file-sharedir-install
 PERL_FILE_SHAREDIR_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SHAREDIR_LICENSE_FILES = LICENSE
+PERL_FILE_SHAREDIR_DISTNAME = File-ShareDir
 
 $(eval $(perl-package))
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 32773ddbbc..64d5cde7a8 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -9,5 +9,6 @@ PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/U/UR/URI
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SLURP_LICENSE_FILES = README
+PERL_FILE_SLURP_DISTNAME = File-Slurp
 
 $(eval $(perl-package))
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index f8f2712199..5437bc11cf 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -10,6 +10,7 @@ PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 PERL_FILE_UTIL_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
+PERL_FILE_UTIL_DISTNAME = File-Util
 HOST_PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 
 $(eval $(perl-package))
diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
index fff4c0ab57..bb48f22782 100644
--- a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
@@ -9,5 +9,6 @@ PERL_FILESYS_NOTIFY_SIMPLE_SOURCE = Filesys-Notify-Simple-$(PERL_FILESYS_NOTIFY_
 PERL_FILESYS_NOTIFY_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_FILESYS_NOTIFY_SIMPLE_LICENSE = Artistic or GPL-1.0+
 PERL_FILESYS_NOTIFY_SIMPLE_LICENSE_FILES = LICENSE
+PERL_FILESYS_NOTIFY_SIMPLE_DISTNAME = Filesys-Notify-Simple
 
 $(eval $(perl-package))
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 3686e9c871..b059dd4c2b 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -10,6 +10,7 @@ PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
 PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
+PERL_GD_DISTNAME = GD
 
 PERL_GD_CONF_OPTS = \
 	-lib_gd_path=$(STAGING_DIR)/usr \
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index d9049d9a85..284dc9dc21 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -9,5 +9,6 @@ PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
 PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
+PERL_GDGRAPH_DISTNAME = GDGraph
 
 $(eval $(perl-package))
diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
index 087102a749..cd1617fbbd 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.mk
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -8,5 +8,6 @@ PERL_GDTEXTUTIL_VERSION = 0.86
 PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
 PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
 PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE
+PERL_GDTEXTUTIL_DISTNAME = GDTextUtil
 
 $(eval $(perl-package))
diff --git a/package/perl-hash-multivalue/perl-hash-multivalue.mk b/package/perl-hash-multivalue/perl-hash-multivalue.mk
index f42bc6092c..dcbfe8431c 100644
--- a/package/perl-hash-multivalue/perl-hash-multivalue.mk
+++ b/package/perl-hash-multivalue/perl-hash-multivalue.mk
@@ -9,5 +9,6 @@ PERL_HASH_MULTIVALUE_SOURCE = Hash-MultiValue-$(PERL_HASH_MULTIVALUE_VERSION).ta
 PERL_HASH_MULTIVALUE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARISTOTLE
 PERL_HASH_MULTIVALUE_LICENSE = Artistic or GPL-1.0+
 PERL_HASH_MULTIVALUE_LICENSE_FILES = LICENSE
+PERL_HASH_MULTIVALUE_DISTNAME = Hash-MultiValue
 
 $(eval $(perl-package))
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index b47db54548..6e5a81bb72 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -9,5 +9,6 @@ PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_PARSER_LICENSE_FILES = README
+PERL_HTML_PARSER_DISTNAME = HTML-Parser
 
 $(eval $(perl-package))
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index ff371fa2d3..c6b5f69134 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -9,5 +9,6 @@ PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
 PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
 PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_TAGSET_LICENSE_FILES = README
+PERL_HTML_TAGSET_DISTNAME = HTML-Tagset
 
 $(eval $(perl-package))
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 764358eac5..74ffe8f426 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -9,5 +9,6 @@ PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_COOKIES_LICENSE_FILES = LICENSE
+PERL_HTTP_COOKIES_DISTNAME = HTTP-Cookies
 
 $(eval $(perl-package))
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 9608d93066..99e053f425 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -9,5 +9,6 @@ PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTTP_DAEMON_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_DAEMON_LICENSE_FILES = README
+PERL_HTTP_DAEMON_DISTNAME = HTTP-Daemon
 
 $(eval $(perl-package))
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index feccf25dd2..5dc91f31de 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -9,5 +9,6 @@ PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTTP_DATE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_DATE_LICENSE_FILES = README
+PERL_HTTP_DATE_DISTNAME = HTTP-Date
 
 $(eval $(perl-package))
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
index 28edde57c0..6d814b2f53 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.mk
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -10,5 +10,6 @@ PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_ENTITY_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_ENTITY_PARSER_LICENSE_FILES = LICENSE
+PERL_HTTP_ENTITY_PARSER_DISTNAME = HTTP-Entity-Parser
 
 $(eval $(perl-package))
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.mk b/package/perl-http-headers-fast/perl-http-headers-fast.mk
index 16056fe67f..fadf06d5b0 100644
--- a/package/perl-http-headers-fast/perl-http-headers-fast.mk
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.mk
@@ -10,5 +10,6 @@ PERL_HTTP_HEADERS_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOKUHIROM
 PERL_HTTP_HEADERS_FAST_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_HEADERS_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_HEADERS_FAST_LICENSE_FILES = LICENSE
+PERL_HTTP_HEADERS_FAST_DISTNAME = HTTP-Headers-Fast
 
 $(eval $(perl-package))
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index b218fb05d9..becae4d17b 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -9,5 +9,6 @@ PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
+PERL_HTTP_MESSAGE_DISTNAME = HTTP-Message
 
 $(eval $(perl-package))
diff --git a/package/perl-http-multipartparser/perl-http-multipartparser.mk b/package/perl-http-multipartparser/perl-http-multipartparser.mk
index aa8b69ad0f..7fb3b8aaaf 100644
--- a/package/perl-http-multipartparser/perl-http-multipartparser.mk
+++ b/package/perl-http-multipartparser/perl-http-multipartparser.mk
@@ -9,5 +9,6 @@ PERL_HTTP_MULTIPARTPARSER_SOURCE = HTTP-MultiPartParser-$(PERL_HTTP_MULTIPARTPAR
 PERL_HTTP_MULTIPARTPARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHANSEN
 PERL_HTTP_MULTIPARTPARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MULTIPARTPARSER_LICENSE_FILES = README
+PERL_HTTP_MULTIPARTPARSER_DISTNAME = HTTP-MultiPartParser
 
 $(eval $(perl-package))
diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
index f7a3032371..868516fa72 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.mk
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -9,5 +9,6 @@ PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.g
 PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
+PERL_HTTP_NEGOTIATE_DISTNAME = HTTP-Negotiate
 
 $(eval $(perl-package))
diff --git a/package/perl-io-html/perl-io-html.mk b/package/perl-io-html/perl-io-html.mk
index bb79f450f2..ae8c6405a3 100644
--- a/package/perl-io-html/perl-io-html.mk
+++ b/package/perl-io-html/perl-io-html.mk
@@ -9,5 +9,6 @@ PERL_IO_HTML_SOURCE = IO-HTML-$(PERL_IO_HTML_VERSION).tar.gz
 PERL_IO_HTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CJ/CJM
 PERL_IO_HTML_LICENSE = Artistic or GPL-1.0+
 PERL_IO_HTML_LICENSE_FILES = LICENSE
+PERL_IO_HTML_DISTNAME = IO-HTML
 
 $(eval $(perl-package))
diff --git a/package/perl-io-interface/perl-io-interface.mk b/package/perl-io-interface/perl-io-interface.mk
index c0b399ace8..84e4d1a9b6 100644
--- a/package/perl-io-interface/perl-io-interface.mk
+++ b/package/perl-io-interface/perl-io-interface.mk
@@ -10,5 +10,6 @@ PERL_IO_INTERFACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
 PERL_IO_INTERFACE_DEPENDENCIES = host-perl-module-build
 PERL_IO_INTERFACE_LICENSE = Artistic-2.0
 PERL_IO_INTERFACE_LICENSE_FILES = LICENSE
+PERL_IO_INTERFACE_DISTNAME = IO-Interface
 
 $(eval $(perl-package))
diff --git a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
index 7f8f5b3b1d..a8c6896ce2 100644
--- a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
+++ b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
@@ -9,5 +9,6 @@ PERL_IO_SOCKET_MULTICAST_SOURCE = IO-Socket-Multicast-$(PERL_IO_SOCKET_MULTICAST
 PERL_IO_SOCKET_MULTICAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BR/BRAMBLE
 PERL_IO_SOCKET_MULTICAST_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_MULTICAST_LICENSE_FILES = README
+PERL_IO_SOCKET_MULTICAST_DISTNAME = IO-Socket-Multicast
 
 $(eval $(perl-package))
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 2c84ef8345..2b3e675d2a 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -9,5 +9,6 @@ PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_SSL_LICENSE_FILES = README
+PERL_IO_SOCKET_SSL_DISTNAME = IO-Socket-SSL
 
 $(eval $(perl-package))
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index b4eaccddcb..cb6518b592 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -9,5 +9,6 @@ PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
 PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
 PERL_JSON_MAYBEXS_LICENSE_FILES = README
+PERL_JSON_MAYBEXS_DISTNAME = JSON-MaybeXS
 
 $(eval $(perl-package))
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 6b45613c5a..886cff8104 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -9,5 +9,6 @@ PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_LICENSE = Artistic-2.0
 PERL_JSON_TINY_LICENSE_FILES = LICENSE
+PERL_JSON_TINY_DISTNAME = JSON-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index d1e26aea44..bd7781a3cd 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -9,5 +9,6 @@ PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LIBWWW_PERL_LICENSE_FILES = LICENSE
+PERL_LIBWWW_PERL_DISTNAME = libwww-perl
 
 $(eval $(perl-package))
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index bcf4e5f742..3ba2abc894 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -9,5 +9,6 @@ PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.g
 PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPL-1.0+
 PERL_LWP_MEDIATYPES_LICENSE_FILES = README
+PERL_LWP_MEDIATYPES_DISTNAME = LWP-MediaTypes
 
 $(eval $(perl-package))
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index e1ce8714cf..6705f68703 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -7,5 +7,6 @@
 PERL_MAIL_DKIM_VERSION = 0.52
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
+PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
 
 $(eval $(perl-package))
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 3a23d5c53a..ef58849b98 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -9,5 +9,6 @@ PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MAILTOOLS_LICENSE_FILES = README
+PERL_MAILTOOLS_DISTNAME = MailTools
 
 $(eval $(perl-package))
diff --git a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
index c29372ecd7..1a6a36eeae 100644
--- a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
+++ b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
@@ -9,5 +9,6 @@ PERL_MIME_BASE64_URLSAFE_SOURCE = MIME-Base64-URLSafe-$(PERL_MIME_BASE64_URLSAFE
 PERL_MIME_BASE64_URLSAFE_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZUHO
 PERL_MIME_BASE64_URLSAFE_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_BASE64_URLSAFE_LICENSE_FILES = README
+PERL_MIME_BASE64_URLSAFE_DISTNAME = MIME-Base64-URLSafe
 
 $(eval $(perl-package))
diff --git a/package/perl-mime-base64/perl-mime-base64.mk b/package/perl-mime-base64/perl-mime-base64.mk
index e7febe1939..201707d46d 100644
--- a/package/perl-mime-base64/perl-mime-base64.mk
+++ b/package/perl-mime-base64/perl-mime-base64.mk
@@ -9,5 +9,6 @@ PERL_MIME_BASE64_SOURCE = MIME-Base64-$(PERL_MIME_BASE64_VERSION).tar.gz
 PERL_MIME_BASE64_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_MIME_BASE64_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_BASE64_LICENSE_FILES = README
+PERL_MIME_BASE64_DISTNAME = MIME-Base64
 
 $(eval $(perl-package))
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 53037bc318..10279d7308 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -9,5 +9,6 @@ PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_TOOLS_LICENSE_FILES = COPYING
+PERL_MIME_TOOLS_DISTNAME = MIME-tools
 
 $(eval $(perl-package))
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index 81e24ab73e..cdf6ac3ec4 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -13,5 +13,6 @@ HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
 	host-perl-extutils-installpaths
 PERL_MODULE_BUILD_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_TINY_LICENSE_FILES = LICENSE
+PERL_MODULE_BUILD_TINY_DISTNAME = Module-Build-Tiny
 
 $(eval $(host-perl-package))
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 42c9c11141..caf68f7fe3 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -9,5 +9,6 @@ PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
+PERL_MODULE_BUILD_DISTNAME = Module-Build
 
 $(eval $(host-perl-package))
diff --git a/package/perl-module-implementation/perl-module-implementation.mk b/package/perl-module-implementation/perl-module-implementation.mk
index 7a23697f88..7cf7cbb215 100644
--- a/package/perl-module-implementation/perl-module-implementation.mk
+++ b/package/perl-module-implementation/perl-module-implementation.mk
@@ -9,5 +9,6 @@ PERL_MODULE_IMPLEMENTATION_SOURCE = Module-Implementation-$(PERL_MODULE_IMPLEMEN
 PERL_MODULE_IMPLEMENTATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
 PERL_MODULE_IMPLEMENTATION_LICENSE = Artistic-2.0
 PERL_MODULE_IMPLEMENTATION_LICENSE_FILES = LICENSE
+PERL_MODULE_IMPLEMENTATION_DISTNAME = Module-Implementation
 
 $(eval $(perl-package))
diff --git a/package/perl-module-runtime/perl-module-runtime.mk b/package/perl-module-runtime/perl-module-runtime.mk
index 5ba95f7056..dcf045cf18 100644
--- a/package/perl-module-runtime/perl-module-runtime.mk
+++ b/package/perl-module-runtime/perl-module-runtime.mk
@@ -10,5 +10,6 @@ PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
 PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
 PERL_MODULE_RUNTIME_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_RUNTIME_LICENSE_FILES = README
+PERL_MODULE_RUNTIME_DISTNAME = Module-Runtime
 
 $(eval $(perl-package))
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index bf5fc93130..cce12314db 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -9,5 +9,6 @@ PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authenticatio
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE_FILES = LICENSE
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_DISTNAME = Mojolicious-Plugin-Authentication
 
 $(eval $(perl-package))
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index f20fabc9fa..c4629356ac 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -9,5 +9,6 @@ PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
+PERL_MOJOLICIOUS_DISTNAME = Mojolicious
 
 $(eval $(perl-package))
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index babb3841b7..64e8d748a9 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -9,5 +9,6 @@ PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
 PERL_MOO_LICENSE_FILES = README
+PERL_MOO_DISTNAME = Moo
 
 $(eval $(perl-package))
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index d594d47d5d..50c7293b56 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -9,5 +9,6 @@ PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
 PERL_NET_DNS_LICENSE_FILES = README
+PERL_NET_DNS_DISTNAME = Net-DNS
 
 $(eval $(perl-package))
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 1030d68b48..da65450eaf 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -9,5 +9,6 @@ PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
 PERL_NET_HTTP_LICENSE_FILES = LICENSE
+PERL_NET_HTTP_DISTNAME = Net-HTTP
 
 $(eval $(perl-package))
diff --git a/package/perl-net-ping/perl-net-ping.mk b/package/perl-net-ping/perl-net-ping.mk
index 51d8f13792..0b863008e0 100644
--- a/package/perl-net-ping/perl-net-ping.mk
+++ b/package/perl-net-ping/perl-net-ping.mk
@@ -9,5 +9,6 @@ PERL_NET_PING_SOURCE = Net-Ping-$(PERL_NET_PING_VERSION).tar.gz
 PERL_NET_PING_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_NET_PING_LICENSE = Artistic or GPL-1.0+
 PERL_NET_PING_LICENSE_FILES = README
+PERL_NET_PING_DISTNAME = Net-Ping
 
 $(eval $(perl-package))
diff --git a/package/perl-net-snmp/perl-net-snmp.mk b/package/perl-net-snmp/perl-net-snmp.mk
index a9daa13d7f..ae8607e406 100644
--- a/package/perl-net-snmp/perl-net-snmp.mk
+++ b/package/perl-net-snmp/perl-net-snmp.mk
@@ -10,5 +10,6 @@ PERL_NET_SNMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DT/DTOWN
 PERL_NET_SNMP_DEPENDENCIES = host-perl-module-build
 PERL_NET_SNMP_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SNMP_LICENSE_FILES = LICENSE
+PERL_NET_SNMP_DISTNAME = Net-SNMP
 
 $(eval $(perl-package))
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index ebd5803826..7860c7f05f 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -10,6 +10,8 @@ PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
+PERL_NET_SSH2_DISTNAME = Net-SSH2
+
 # build system will use host search paths by default
 PERL_NET_SSH2_CONF_OPTS += \
 	lib="$(STAGING_DIR)/usr/lib" \
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 2b3b10716d..80ce8b9cc7 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -10,6 +10,7 @@ PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
 PERL_NET_SSLEAY_LICENSE = OpenSSL
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
+PERL_NET_SSLEAY_DISTNAME = Net-SSLeay
 
 # Try as hard as possible to remedy to the brain-damage their build-system
 # suffers from: don't search for openssl, they pick the host-system one.
diff --git a/package/perl-net-telnet/perl-net-telnet.mk b/package/perl-net-telnet/perl-net-telnet.mk
index 28568871e2..0b9cce0af8 100644
--- a/package/perl-net-telnet/perl-net-telnet.mk
+++ b/package/perl-net-telnet/perl-net-telnet.mk
@@ -9,5 +9,6 @@ PERL_NET_TELNET_SOURCE = Net-Telnet-$(PERL_NET_TELNET_VERSION).tar.gz
 PERL_NET_TELNET_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROGERS
 PERL_NET_TELNET_LICENSE = Artistic or GPL-1.0+
 PERL_NET_TELNET_LICENSE_FILES = README
+PERL_NET_TELNET_DISTNAME = Net-Telnet
 
 $(eval $(perl-package))
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index e96e42a852..4824b4e9ee 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -9,6 +9,7 @@ PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPL-1.0+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
+PERL_NETADDR_IP_DISTNAME = NetAddr-IP
 
 ifeq ($(BR2_STATIC_LIBS),y)
 PERL_NETADDR_IP_CONF_OPTS = -noxs
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.mk b/package/perl-number-bytes-human/perl-number-bytes-human.mk
index e10c550eed..d2d712f8fa 100644
--- a/package/perl-number-bytes-human/perl-number-bytes-human.mk
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.mk
@@ -9,5 +9,6 @@ PERL_NUMBER_BYTES_HUMAN_SOURCE = Number-Bytes-Human-$(PERL_NUMBER_BYTES_HUMAN_VE
 PERL_NUMBER_BYTES_HUMAN_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FE/FERREIRA
 PERL_NUMBER_BYTES_HUMAN_LICENSE = Artistic or GPL-1.0+
 PERL_NUMBER_BYTES_HUMAN_LICENSE_FILES = README
+PERL_NUMBER_BYTES_HUMAN_DISTNAME = Number-Bytes-Human
 
 $(eval $(perl-package))
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index 5d787714b8..26e8eb3253 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -9,5 +9,6 @@ PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
 PERL_PACKAGE_STASH_LICENSE_FILES = LICENSE
+PERL_PACKAGE_STASH_DISTNAME = Package-Stash
 
 $(eval $(perl-package))
diff --git a/package/perl-params-util/perl-params-util.mk b/package/perl-params-util/perl-params-util.mk
index 71868ddff4..c33ea816eb 100644
--- a/package/perl-params-util/perl-params-util.mk
+++ b/package/perl-params-util/perl-params-util.mk
@@ -9,5 +9,6 @@ PERL_PARAMS_UTIL_SOURCE = Params-Util-$(PERL_PARAMS_UTIL_VERSION).tar.gz
 PERL_PARAMS_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
 PERL_PARAMS_UTIL_LICENSE = Artistic or GPL-1.0+
 PERL_PARAMS_UTIL_LICENSE_FILES = LICENSE
+PERL_PARAMS_UTIL_DISTNAME = Params-Util
 
 $(eval $(perl-package))
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 53e787dc10..efcf241d0b 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -9,5 +9,6 @@ PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
 PERL_PATH_TINY_LICENSE_FILES = LICENSE
+PERL_PATH_TINY_DISTNAME = Path-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index d6c8bf449b..cccf5a6224 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -10,5 +10,6 @@ PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
 PERL_PLACK_LICENSE = Artistic or GPL-1.0+
 PERL_PLACK_LICENSE_FILES = LICENSE
+PERL_PLACK_DISTNAME = Plack
 
 $(eval $(perl-package))
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
index b95637de0a..d7e23d254f 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
@@ -10,5 +10,6 @@ PERL_POSIX_STRFTIME_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build
 PERL_POSIX_STRFTIME_COMPILER_LICENSE = Artistic or GPL-1.0+
 PERL_POSIX_STRFTIME_COMPILER_LICENSE_FILES = LICENSE
+PERL_POSIX_STRFTIME_COMPILER_DISTNAME = POSIX-strftime-Compiler
 
 $(eval $(perl-package))
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index ccc82abc83..6501972f22 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -9,5 +9,6 @@ PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_ROLE_TINY_LICENSE_FILES = README
+PERL_ROLE_TINY_DISTNAME = Role-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-stream-buffered/perl-stream-buffered.mk b/package/perl-stream-buffered/perl-stream-buffered.mk
index 677ac979f1..63aa1a2461 100644
--- a/package/perl-stream-buffered/perl-stream-buffered.mk
+++ b/package/perl-stream-buffered/perl-stream-buffered.mk
@@ -9,5 +9,6 @@ PERL_STREAM_BUFFERED_SOURCE = Stream-Buffered-$(PERL_STREAM_BUFFERED_VERSION).ta
 PERL_STREAM_BUFFERED_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
 PERL_STREAM_BUFFERED_LICENSE = Artistic or GPL-1.0+
 PERL_STREAM_BUFFERED_LICENSE_FILES = LICENSE
+PERL_STREAM_BUFFERED_DISTNAME = Stream-Buffered
 
 $(eval $(perl-package))
diff --git a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
index a8a46dd11e..22fc29d5b1 100644
--- a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
+++ b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
@@ -9,5 +9,6 @@ PERL_SUB_EXPORTER_PROGRESSIVE_SOURCE = Sub-Exporter-Progressive-$(PERL_SUB_EXPOR
 PERL_SUB_EXPORTER_PROGRESSIVE_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FR/FREW
 PERL_SUB_EXPORTER_PROGRESSIVE_LICENSE = Artistic or GPL-1.0+
 PERL_SUB_EXPORTER_PROGRESSIVE_LICENSE_FILES = LICENSE
+PERL_SUB_EXPORTER_PROGRESSIVE_DISTNAME = Sub-Exporter-Progressive
 
 $(eval $(perl-package))
diff --git a/package/perl-sub-install/perl-sub-install.mk b/package/perl-sub-install/perl-sub-install.mk
index fc7c55afb8..85d60caf52 100644
--- a/package/perl-sub-install/perl-sub-install.mk
+++ b/package/perl-sub-install/perl-sub-install.mk
@@ -9,5 +9,6 @@ PERL_SUB_INSTALL_SOURCE = Sub-Install-$(PERL_SUB_INSTALL_VERSION).tar.gz
 PERL_SUB_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_SUB_INSTALL_LICENSE = Artistic or GPL-1.0+
 PERL_SUB_INSTALL_LICENSE_FILES = LICENSE
+PERL_SUB_INSTALL_DISTNAME = Sub-Install
 
 $(eval $(perl-package))
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 7f94322295..1e364f2133 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -9,5 +9,6 @@ PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
 PERL_SUB_QUOTE_LICENSE_FILES = README
+PERL_SUB_QUOTE_DISTNAME = Sub-Quote
 
 $(eval $(perl-package))
diff --git a/package/perl-sys-meminfo/perl-sys-meminfo.mk b/package/perl-sys-meminfo/perl-sys-meminfo.mk
index 43e0995aa0..e70dd73af9 100644
--- a/package/perl-sys-meminfo/perl-sys-meminfo.mk
+++ b/package/perl-sys-meminfo/perl-sys-meminfo.mk
@@ -9,5 +9,6 @@ PERL_SYS_MEMINFO_SOURCE = Sys-MemInfo-$(PERL_SYS_MEMINFO_VERSION).tar.gz
 PERL_SYS_MEMINFO_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SC/SCRESTO
 PERL_SYS_MEMINFO_LICENSE = Artistic or GPL-1.0+
 PERL_SYS_MEMINFO_LICENSE_FILES = LICENSE
+PERL_SYS_MEMINFO_DISTNAME = Sys-MemInfo
 
 $(eval $(perl-package))
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
index e028da1008..489d4dd7ee 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.mk
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -9,5 +9,6 @@ PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
 PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
 PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
 PERL_SYS_MMAP_LICENSE_FILES = Artistic Copying
+PERL_SYS_MMAP_DISTNAME = Sys-Mmap
 
 $(eval $(perl-package))
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
index 271c1398a3..03322c3fb0 100644
--- a/package/perl-time-hires/perl-time-hires.mk
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -9,5 +9,6 @@ PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
 PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JH/JHI
 PERL_TIME_HIRES_LICENSE = Artistic or GPL-1.0+
 PERL_TIME_HIRES_LICENSE_FILES = README
+PERL_TIME_HIRES_DISTNAME = Time-HiRes
 
 $(eval $(perl-package))
diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
index 39f687d402..cba8c7b6b1 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.mk
+++ b/package/perl-time-parsedate/perl-time-parsedate.mk
@@ -9,5 +9,6 @@ PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.g
 PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
 PERL_TIME_PARSEDATE_LICENSE = Time Parse Date License, Public Domain
 PERL_TIME_PARSEDATE_LICENSE_FILES = lib/Time/JulianDay.pm lib/Time/Timezone.pm
+PERL_TIME_PARSEDATE_DISTNAME = Time-ParseDate
 
 $(eval $(perl-package))
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index cdc2c07fee..bc4fc9a11f 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -9,5 +9,6 @@ PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
 PERL_TIMEDATE_LICENSE_FILES = README
+PERL_TIMEDATE_DISTNAME = TimeDate
 
 $(eval $(perl-package))
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index f9113e7069..bce96269d2 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -9,5 +9,6 @@ PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
 PERL_TRY_TINY_LICENSE_FILES = README
+PERL_TRY_TINY_DISTNAME = Try-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 7a433d6472..d3cdd28bd9 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -9,5 +9,6 @@ PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_TYPE_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+PERL_TYPE_TINY_DISTNAME = Type-Tiny
 
 $(eval $(perl-package))
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 10a5bb8bda..5be4401314 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -9,5 +9,6 @@ PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
+PERL_URI_DISTNAME = URI
 
 $(eval $(perl-package))
diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
index 8b922638ea..a0ccba5312 100644
--- a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
@@ -10,5 +10,6 @@ PERL_WWW_FORM_URLENCODED_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_WWW_FORM_URLENCODED_DEPENDENCIES = host-perl-module-build
 PERL_WWW_FORM_URLENCODED_LICENSE = Artistic or GPL-1.0+
 PERL_WWW_FORM_URLENCODED_LICENSE_FILES = LICENSE
+PERL_WWW_FORM_URLENCODED_DISTNAME = WWW-Form-UrlEncoded
 
 $(eval $(perl-package))
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 7d85aa25ef..052d9a6743 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -9,5 +9,6 @@ PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.g
 PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPL-1.0+
 PERL_WWW_ROBOTRULES_LICENSE_FILES = README
+PERL_WWW_ROBOTRULES_DISTNAME = WWW-RobotRules
 
 $(eval $(perl-package))
diff --git a/package/perl-x10/perl-x10.mk b/package/perl-x10/perl-x10.mk
index e194267563..4c90be65b2 100644
--- a/package/perl-x10/perl-x10.mk
+++ b/package/perl-x10/perl-x10.mk
@@ -9,5 +9,6 @@ PERL_X10_SOURCE = X10-$(PERL_X10_VERSION).tar.gz
 PERL_X10_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
 PERL_X10_LICENSE = GPL-3.0
 PERL_X10_LICENSE_FILES = README
+PERL_X10_DISTNAME = X10
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 81a379fa5a..3218d34d53 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -10,6 +10,7 @@ PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2
 PERL_XML_LIBXML_LICENSE = Artistic or GPL-1.0+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
+PERL_XML_LIBXML_DISTNAME = XML-LibXML
 
 PERL_XML_LIBXML_CONF_OPTS = \
 	LIBS="-L $(STAGING_DIR)/usr/lib" \
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index 325440b33a..c3c54da6a8 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -9,5 +9,6 @@ PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPP
 PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
 PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPL-1.0+
 PERL_XML_NAMESPACESUPPORT_LICENSE_FILES = LICENSE
+PERL_XML_NAMESPACESUPPORT_DISTNAME = XML-NamespaceSupport
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index ec6e052b72..810a46046d 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -9,5 +9,6 @@ PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
 PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_BASE_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_BASE_LICENSE_FILES = README
+PERL_XML_SAX_BASE_DISTNAME = XML-SAX-Base
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index abfac5ed10..17518367dc 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -9,5 +9,6 @@ PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_LICENSE_FILES = LICENSE
+PERL_XML_SAX_DISTNAME = XML-SAX
 
 $(eval $(perl-package))
