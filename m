From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 24 Jul 2015 22:05:16 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-pydal: bump to version v15.07
In-Reply-To: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1437768317-9283-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1437768317-9283-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-pydal to version v15.07.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pydal/python-pydal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index a99b61e..4c5da41 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = v15.03
+PYTHON_PYDAL_VERSION = v15.07
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3c
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
-- 
1.9.1
