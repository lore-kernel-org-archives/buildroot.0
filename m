From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:27:03 +0200
Subject: [Buildroot] [git commit] package/perl-params-util: bump to version
 1.101
Message-ID: <20201024201639.D68A182872@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af87bcede85f499c9cdb33f460d2d46e72cc3242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

split LICENSE file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-params-util/perl-params-util.hash | 8 +++++---
 package/perl-params-util/perl-params-util.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/perl-params-util/perl-params-util.hash b/package/perl-params-util/perl-params-util.hash
index 0c247ebfe5..d43b8baffc 100644
--- a/package/perl-params-util/perl-params-util.hash
+++ b/package/perl-params-util/perl-params-util.hash
@@ -1,6 +1,8 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    02db120c0eef87aae1830cc62bdec37b Params-Util-1.07.tar.gz
-sha256 30f1ec3f2cf9ff66ae96f973333f23c5f558915bb6266881eac7423f52d7c76c Params-Util-1.07.tar.gz
+md5  eaf000a27bbd21abfd55f83473ab79fd  Params-Util-1.101.tar.gz
+sha256  97f391bc092b9c911e4536d103afd48058eb1f8a53d729af7adb65430eb338b7  Params-Util-1.101.tar.gz
 
 # computed by scancpan
-sha256 71b5fb95de1ba013a517c926feaa2a7d0fb0e8f132818e8529e0da5ec01187cd LICENSE
+sha256  08c2ed7589aff3b2076b48b792078d3479c2295559ee7bc4615e93abe0473939  ARTISTIC-1.0
+sha256  3d2fb9b42d1134f39c2e990d66b5e9b77005663fe956db526cc380eb3d9a77d8  GPL-1
+sha256  834c4ebff45be11f35f059b077fdd747dee4b8a747b95049d849fef1c0ccdc62  LICENSE
diff --git a/package/perl-params-util/perl-params-util.mk b/package/perl-params-util/perl-params-util.mk
index c33ea816eb..1a48a46fe2 100644
--- a/package/perl-params-util/perl-params-util.mk
+++ b/package/perl-params-util/perl-params-util.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_PARAMS_UTIL_VERSION = 1.07
+PERL_PARAMS_UTIL_VERSION = 1.101
 PERL_PARAMS_UTIL_SOURCE = Params-Util-$(PERL_PARAMS_UTIL_VERSION).tar.gz
-PERL_PARAMS_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
+PERL_PARAMS_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
 PERL_PARAMS_UTIL_LICENSE = Artistic or GPL-1.0+
-PERL_PARAMS_UTIL_LICENSE_FILES = LICENSE
+PERL_PARAMS_UTIL_LICENSE_FILES = ARTISTIC-1.0 GPL-1 LICENSE
 PERL_PARAMS_UTIL_DISTNAME = Params-Util
 
 $(eval $(perl-package))
