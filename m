From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:33:32 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 support/testing/tests/core/test_timezone.py: fix indentation
Message-ID: <20200828164643.0792685FE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=909431a71e0c4a90c22f95af31de9f787ed98d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:

support/testing/tests/core/test_timezone.py:7:9: E117 over-indented

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cc061128de8d99fd9e14c507b76d50852dce4f7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/core/test_timezone.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index 050624e0aa..f661519196 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -4,10 +4,10 @@ import infra.basetest
 
 
 def boot_armv5_cpio(emulator, builddir):
-        img = os.path.join(builddir, "images", "rootfs.cpio")
-        emulator.boot(arch="armv5", kernel="builtin",
-                      options=["-initrd", img])
-        emulator.login()
+    img = os.path.join(builddir, "images", "rootfs.cpio")
+    emulator.boot(arch="armv5", kernel="builtin",
+                  options=["-initrd", img])
+    emulator.login()
 
 
 class TestNoTimezone(infra.basetest.BRTest):
