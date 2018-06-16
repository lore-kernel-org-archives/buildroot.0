From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:21 +0200
Subject: [Buildroot] [PATCH 01/34] perl-datetime-tiny: bump to version 1.07
Message-ID: <20180616081654.34649-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-datetime-tiny/perl-datetime-tiny.hash | 7 +++++--
 package/perl-datetime-tiny/perl-datetime-tiny.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.hash b/package/perl-datetime-tiny/perl-datetime-tiny.hash
index 68f2c025e..62fe407d2 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.hash
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    736be4b3e8171f4a029fb6ac3712a9b4 DateTime-Tiny-1.06.tar.gz
-sha256 bd725df481d7223ee787e154c116098b08a129f55e0763194b07ebea3dda33ec DateTime-Tiny-1.06.tar.gz
+md5    5ac2924652edb0cf5fda7c9d52162b3f DateTime-Tiny-1.07.tar.gz
+sha256 83568a22838cb518fbeb9e060460ec7f59d5a0b0a1cc06562954c3674d7cf7e4 DateTime-Tiny-1.07.tar.gz
+
+# computed by scancpan
+sha256 21cda7a55a8d4b32a43c654f0d4d4a1587096b35bf2a93ea12a2e3a8c2c0b88f LICENSE
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 6b5496719..e8ee3d60e 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATETIME_TINY_VERSION = 1.06
+PERL_DATETIME_TINY_VERSION = 1.07
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_DATETIME_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
