From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 18:53:55 +0200
Subject: [Buildroot] [git commit] package/python-cherrypy: fix legal-info
Message-ID: <20150405171514.54A907F8D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8077d2367c524360daab5353090ca1ae0821dd2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cherrypy/python-cherrypy.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
