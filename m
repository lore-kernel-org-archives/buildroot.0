From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:19:02 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: drop AUTORECONF =
 YES
Message-ID: <20190115201926.16F7A838F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03be221c612c9a2a90120bff34d76221040147dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-statx-fix-compile-errors.patch has been dropped, so autoreconf is
no longer needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ecd822b4d6..ebc386d0cf 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -75,7 +75,4 @@ endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
 endif
 
-# 0002-statx-fix-compile-errors.patch
-LTP_TESTSUITE_AUTORECONF = YES
-
 $(eval $(autotools-package))
