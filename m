From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 10 May 2017 23:33:45 +0200
Subject: [Buildroot] [PATCH 2/3] support/testing: remove unused variable
In-Reply-To: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
References: <1494452026-21567-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1494452026-21567-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/testing/infra/basetest.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index cb5d2100f44a..557baa215c65 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -41,7 +41,6 @@ class BRTest(unittest.TestCase):
     def setUp(self):
         self.testname = self.__class__.__name__
         self.builddir = os.path.join(self.__class__.outputdir, self.testname)
-        self.runlog = self.builddir + "-run.log"
         self.emulator = None
         self.show_msg("Starting")
         self.b = Builder(self.__class__.config, self.builddir, self.logtofile)
-- 
2.7.4
