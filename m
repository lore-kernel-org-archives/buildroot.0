From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:42:27 +0200
Subject: [Buildroot] [git commit] support/testing: remove unused variable
Message-ID: <20170510214233.857CD8215B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bab4a2fd37b1ce4bdeb25f7bf98adf07eea8c504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index cb5d210..557baa2 100644
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
