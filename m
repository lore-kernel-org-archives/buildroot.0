From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2015 13:51:39 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: version bump to
	20150420
Message-ID: <20150929120702.851D8801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=576cf9dca82e2bb2ad277c43d1c4474fb66a2cd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.hash |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 77ec483..5923daf 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  c21b91407f94a0c55c4cd3f12a0dc30f1d17cd2d4c44598f81ca075843141496  ltp-full-20140115.tar.xz
+sha256  ad504e6697b964787f51caad6d8a916caa367f241ac602545548488195216a80  ltp-full-20150420.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 634fc45..32038a0 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20140115
+LTP_TESTSUITE_VERSION = 20150420
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
