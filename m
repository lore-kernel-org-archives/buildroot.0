From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:29:01 +0200
Subject: [Buildroot] [PATCH 3/7]
 support/testing/tests/core/test_timezone.py: fix indentation
In-Reply-To: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200812142906.598755-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

support/testing/tests/core/test_timezone.py:7:9: E117 over-indented

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.26.2
