From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 21 Nov 2015 16:41:19 +0100
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 2.11.3
Message-ID: <1448120479-7715-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps web2py version to 2.11.3

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/python-web2py.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 2991bb8..02c854d 100644
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
-- 
1.9.1
