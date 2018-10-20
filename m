From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 20 Oct 2018 10:22:47 -0500
Subject: [Buildroot] [PATCH] support/testing: test_hardening fix flake8
 whitespace
Message-ID: <20181020152247.17493-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Resolves:
support/testing/tests/core/test_hardening.py:25:42: E231 missing whitespace after ','

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/testing/tests/core/test_hardening.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 9f26962b30..82e0f3d8f2 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -22,7 +22,7 @@ class TestHardeningBase(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
-    checksec_files = ["usr/sbin/lighttpd","bin/busybox"]
+    checksec_files = ["usr/sbin/lighttpd", "bin/busybox"]
 
     def checksec_run(self, target_file):
         filepath = os.path.join(self.builddir, "target", target_file)
-- 
2.18.0
