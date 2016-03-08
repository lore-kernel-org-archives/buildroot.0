From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 23:59:40 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: indentation cleanup
Message-ID: <20160308225957.826ED802CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=882dd6027689005d2321689cc0776fcb0b0afc2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 81b1d87..7d455de 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -41,9 +41,9 @@ LTP_TESTSUITE_CONF_ENV += \
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED
-        rm -rf $(@D)/testcases/kernel/controllers/cpuset/
-        rm -rf $(@D)/testcases/misc/math/float/bessel/
-        rm -f $(@D)/testcases/misc/math/float/float_bessel.c
+	rm -rf $(@D)/testcases/kernel/controllers/cpuset/
+	rm -rf $(@D)/testcases/misc/math/float/bessel/
+	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
 endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
 endif
