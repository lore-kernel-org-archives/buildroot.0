From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 14:39:00 +0100
Subject: [Buildroot] [git commit] package/perl-json-maybexs: bump to version
 1.004003
Message-ID: <20201205132743.863727FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2ee3c12f00df3c3b2df204baada8533d578312b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-json-maybexs/perl-json-maybexs.hash | 4 ++--
 package/perl-json-maybexs/perl-json-maybexs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-json-maybexs/perl-json-maybexs.hash b/package/perl-json-maybexs/perl-json-maybexs.hash
index 3f1a99c38c..a53d4ec616 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.hash
+++ b/package/perl-json-maybexs/perl-json-maybexs.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  2c40209b38b7a569b3bfc4d88e47d98c  JSON-MaybeXS-1.004002.tar.gz
-sha256  3b8e2fdc3b36d0c5edbc78121840dced63798ad49cabcf875d5c5e32336d77b5  JSON-MaybeXS-1.004002.tar.gz
+md5  e46181e34588428d317932744597a7ab  JSON-MaybeXS-1.004003.tar.gz
+sha256  5bee3b17ff9dcffd6e99ab8cf7f35747650bfce1dc622e3ad10b85a194462fbf  JSON-MaybeXS-1.004003.tar.gz
 
 # computed by scancpan
 sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index bb11cd3a29..e6891f6808 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_MAYBEXS_VERSION = 1.004002
+PERL_JSON_MAYBEXS_VERSION = 1.004003
 PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
 PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
