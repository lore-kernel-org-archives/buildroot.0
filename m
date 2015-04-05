From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 18:48:23 +0200
Subject: [Buildroot] [PATCH 2/6] package/python-cherrypy: fix legal-info
In-Reply-To: <cover.1428252467.git.yann.morin.1998@free.fr>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
Message-ID: <fb978b814c6397df4c3443e86529a10c18356e8e.1428252467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/python-cherrypy/python-cherrypy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index a08b21a..a07f9ed 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -8,7 +8,7 @@ PYTHON_CHERRYPY_VERSION = 3.6.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
 PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
 PYTHON_CHERRYPY_LICENSE = BSD-3c
-PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.txt
+PYTHON_CHERRYPY_LICENSE_FILES = cherrypy/LICENSE.txt
 PYTHON_CHERRYPY_SETUP_TYPE = distutils
 
 $(eval $(python-package))
-- 
1.9.1
