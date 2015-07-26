From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:34:03 +0200
Subject: [Buildroot] [git commit] package/python-web2py: bump to version
	R-2.11.2
Message-ID: <20150726163407.30B0181942@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a0c5de068cbbd224702db19d1c3674919a7609e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps python-web2py to version R-2.11.2.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-web2py/python-web2py.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 641d7ef..313114a 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = R-2.10.3
+PYTHON_WEB2PY_VERSION = R-2.11.2
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPLv3
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
