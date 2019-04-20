From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:18:58 +0200
Subject: [Buildroot] [git commit] package/python-pyelftools: add host variant
Message-ID: <20190420201856.D16A27FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2f9cc634863607b063d55562abcf465e80ba148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This would be used by uboot for rockchip rk3399
socs boards.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyelftools/python-pyelftools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 5b5b488cf0..92dafbe27f 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -12,3 +12,4 @@ PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = distutils
 
 $(eval $(python-package))
+$(eval $(host-python-package))
