From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:32:40 +0100
Subject: [Buildroot] [git commit] python-yarl: add missing blank line in .mk
 file
Message-ID: <20181101123128.CB80783C23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48ff413a8cac84659686a13629d8d49af9aa54cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/python-yarl/python-yarl.mk:6: should be a blank line (http://nightly.buildroot.org/#writing-rules-mk)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yarl/python-yarl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 94c3db370b..591131e4a2 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -3,6 +3,7 @@
 # python-yarl
 #
 ################################################################################
+
 PYTHON_YARL_VERSION = 1.2.6
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
 PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/43/b8/057c3e5b546ff4b24263164ecda13f6962d85c9dc477fcc0bcdcb3adb658
