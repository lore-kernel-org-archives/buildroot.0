From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 23:07:17 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: bump version to 20140115
Message-ID: <20140228133412.32D8D9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=898e54bd783280ee1ffb6aeeb523c9fb8c31641a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
   http://autobuild.buildroot.net/results/14c/14c107a735bb54f55c99391b0ea0ff6bd1234e12/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 594fa18..6294c5e 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20130904
+LTP_TESTSUITE_VERSION = 20140115
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
