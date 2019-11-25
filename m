From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 25 Nov 2019 21:30:02 +0100
Subject: [Buildroot] [PATCH/next] basetest.py: fix code style
In-Reply-To: <1574713802-20461-1-git-send-email-pjtexier@koncepto.io>
References: <1574713802-20461-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1574713802-20461-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:

W291 trailing whitespace

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/360824861

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 support/testing/infra/basetest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 023039f..5dc6034 100644
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
-- 
2.7.4
