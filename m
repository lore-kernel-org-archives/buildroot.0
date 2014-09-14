From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Sep 2014 23:48:55 +0200
Subject: [Buildroot] [git commit] google-breakpad: bump to version r1373
Message-ID: <20140914215259.810D69D65E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11e149d4962b7bd04512b5b8bcae59d3061b999b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version adds support for installing important header files to
<staging>/usr/include/breakpad. It's no longer necessary to include the
whole breakpad source tree when building applications using libbreakpad.a.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/google-breakpad/google-breakpad.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index add5d7a..cdf0a1e 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOOGLE_BREAKPAD_VERSION = 1320
+GOOGLE_BREAKPAD_VERSION = 1373
 GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
 GOOGLE_BREAKPAD_SITE_METHOD = svn
 GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
