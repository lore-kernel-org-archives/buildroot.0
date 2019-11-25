From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:40:52 +0100
Subject: [Buildroot] [git commit branch/next] support/testing: basetest.py:
 fix code style
Message-ID: <20191125203310.5719083238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bda40089751ea9099389e2487c1b968218322c7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix these warnings:

W291 trailing whitespace

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/360824861

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 023039f6af..5dc6034447 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -85,7 +85,7 @@ class BRTest(BRConfigTest):
             self.emulator.stop()
         super(BRTest, self).tearDown()
 
-    # Run the given 'cmd' with a 'timeout' on the target and 
+    # Run the given 'cmd' with a 'timeout' on the target and
     # assert that the command succeeded
     def assertRunOk(self, cmd, timeout=-1):
         _, exit_code = self.emulator.run(cmd, timeout)
