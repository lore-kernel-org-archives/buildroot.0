From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:29:52 +0200
Subject: [Buildroot] [git commit] perl-time-hires: bump to version 1.9758
Message-ID: <20180616122909.846D28849C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c2003b22f6a5e030485f8c8c4ceac2f0aa7e940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-time-hires/perl-time-hires.hash | 7 +++++--
 package/perl-time-hires/perl-time-hires.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/perl-time-hires/perl-time-hires.hash b/package/perl-time-hires/perl-time-hires.hash
index f3ab700ea3..4260766681 100644
--- a/package/perl-time-hires/perl-time-hires.hash
+++ b/package/perl-time-hires/perl-time-hires.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b98099e0cb7702210606776e9746e103 Time-HiRes-1.9753.tar.gz
-sha256 0fbfd5f99cdd26011d5c0bc3a8e369dacc4a9e1d1658f4663ac6018f2cec4915 Time-HiRes-1.9753.tar.gz
+md5    8f998cb60966c86e24c500016e4d1ce8 Time-HiRes-1.9758.tar.gz
+sha256 5bfa145bc11e70a8e337543b1084a293743a690691b568493455dedf58f34b1e Time-HiRes-1.9758.tar.gz
+
+# computed by scancpan
+sha256 ecc20782bd6c34d2d632356020f9ad0150c7ae1803ae9560258d76d4533030da README
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
index c8dde49f2f..271c1398a3 100644
--- a/package/perl-time-hires/perl-time-hires.mk
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TIME_HIRES_VERSION = 1.9753
+PERL_TIME_HIRES_VERSION = 1.9758
 PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
 PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JH/JHI
 PERL_TIME_HIRES_LICENSE = Artistic or GPL-1.0+
