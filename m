From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Thu, 18 Apr 2019 18:53:30 +0530
Subject: [Buildroot] [PATCH 1/2] package/python-pyelftools: Add host variant
Message-ID: <20190418132331.14213-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This would be used by uboot for rockchip rk3399
socs boards.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
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
-- 
2.11.0
