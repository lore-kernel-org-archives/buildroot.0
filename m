From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:37:05 +0200
Subject: [Buildroot] [git commit] package/perl-json-maybexs: bump to version
 1.004002
Message-ID: <20200605203650.B08F280E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd332f0124f412aa033d487faeea8ab72042311b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

now, LICENSE has its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-json-maybexs/perl-json-maybexs.hash | 6 +++---
 package/perl-json-maybexs/perl-json-maybexs.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-json-maybexs/perl-json-maybexs.hash b/package/perl-json-maybexs/perl-json-maybexs.hash
index c8bf172aaa..3f1a99c38c 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.hash
+++ b/package/perl-json-maybexs/perl-json-maybexs.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    db61fb5515f8e2f19709a317e26dde42 JSON-MaybeXS-1.004000.tar.gz
-sha256 59bda02e8f4474c73913723c608b539e2452e16c54ed7f0150c01aad06e0a126 JSON-MaybeXS-1.004000.tar.gz
+md5  2c40209b38b7a569b3bfc4d88e47d98c  JSON-MaybeXS-1.004002.tar.gz
+sha256  3b8e2fdc3b36d0c5edbc78121840dced63798ad49cabcf875d5c5e32336d77b5  JSON-MaybeXS-1.004002.tar.gz
 
 # computed by scancpan
-sha256 d972e00126c5337e88d81d64fc349a3f4c54841075f4180a1145441d30c86f83 README
+sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index cb6518b592..bb11cd3a29 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_JSON_MAYBEXS_VERSION = 1.004000
+PERL_JSON_MAYBEXS_VERSION = 1.004002
 PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
-PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
-PERL_JSON_MAYBEXS_LICENSE_FILES = README
+PERL_JSON_MAYBEXS_LICENSE_FILES = LICENSE
 PERL_JSON_MAYBEXS_DISTNAME = JSON-MaybeXS
 
 $(eval $(perl-package))
