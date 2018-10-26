From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:20:15 +0200
Subject: [Buildroot] [git commit] perl-path-tiny: bump to version 0.104
Message-ID: <20181026191920.28E7F8910C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ece585dee15c7293264fd7803b795084ec08326b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index c73b621ebb..2ad8a6414c 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    17354181d9794df01be555b25114dd24 Path-Tiny-0.104.tar.gz
-sha256 c69f1dcfeb4aa004086deb9bc14c7d79f45798b947f1efbd634a3442e267aaef Path-Tiny-0.104.tar.gz
+md5    1a7fbdccc4585074ce4419b7bec0966c Path-Tiny-0.108.tar.gz
+sha256 3c49482be2b3eb7ddd7e73a5b90cff648393f5d5de334ff126ce7a3632723ff5 Path-Tiny-0.108.tar.gz
 
 # computed by scancpan
 sha256 a999b03d2b80e5c7f987289ac835fa2d88cafa9f0df24adf8a1fd21e175acd79 LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index efcf241d0b..5d654efee3 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.104
+PERL_PATH_TINY_VERSION = 0.108
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
