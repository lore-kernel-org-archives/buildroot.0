From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 14 Nov 2014 18:31:29 +0100
Subject: [Buildroot] [PATCH] perl-cross: bump to version 0.9.4
Message-ID: <1415986289-22531-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this release fixes the build when BR2_PREFER_STATIC_LIB
see http://autobuild.buildroot.net/results/057/057a4b9976fd6b9c5cddd117a3f29de51efe719f/build-end.log
see https://github.com/arsv/perl-cross/issues/11

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 1d7923a..f0de59c 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,7 +12,7 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.9.3
+PERL_CROSS_VERSION = 0.9.4
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
-- 
2.1.0
