From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:27:28 +0200
Subject: [Buildroot] [git commit] support/testing: test_hardening fix flake8
 whitespace
Message-ID: <20181020152559.81D9C83F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa2eb4bd645f636b313f0fbac9f4775263685d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Resolves:
support/testing/tests/core/test_hardening.py:25:42: E231 missing whitespace after ','

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
