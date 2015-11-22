From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:10:20 +0100
Subject: [Buildroot] [git commit branch/next] python-web2py: bump to version
	2.11.3
Message-ID: <20151122131037.77D1F81D26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d13d02556595fb0c63d4a269e51a80abe0dc555e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps web2py version to 2.11.3

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-web2py/python-web2py.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index db9ed8d..f5f572c 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.11.2
+PYTHON_WEB2PY_VERSION = R-2.11.3
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPLv3
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
