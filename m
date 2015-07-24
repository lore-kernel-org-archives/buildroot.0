From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 24 Jul 2015 22:05:17 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-web2py: bump to version
	R-2.11.2
In-Reply-To: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1437768317-9283-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-web2py to version R-2.11.2.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-web2py/python-web2py.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 8eab6bd..869d723 100644
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
-- 
1.9.1
