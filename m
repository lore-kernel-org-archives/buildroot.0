From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 21 Dec 2015 11:50:24 +0100
Subject: [Buildroot] [PATCH 4/4] python-cherrypy: bump to 4.0.0
In-Reply-To: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
References: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1450695024-24875-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cherrypy/python-cherrypy.hash | 6 +++---
 package/python-cherrypy/python-cherrypy.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 08fa075..6befa45 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9772dbee426d656f01a13881e2b139d8, sha256 locally computed
-md5	9772dbee426d656f01a13881e2b139d8  CherryPy-3.6.0.tar.gz
-sha256	a149271819a15417104aa8f641ad5b96287070f0153e6ef2832a87e2c693d75d  CherryPy-3.6.0.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=4b765329b0b4b65ec25811e3febb6c93, sha256 locally computed
+md5	4b765329b0b4b65ec25811e3febb6c93  CherryPy-4.0.0.tar.gz
+sha256	73ad4f8870b5a3e9988a7778b5d3003a390d440527ec3458a0c7e58865d2611a  CherryPy-4.0.0.tar.gz
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index a07f9ed..754e0a2 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 3.6.0
+PYTHON_CHERRYPY_VERSION = 4.0.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
 PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
 PYTHON_CHERRYPY_LICENSE = BSD-3c
-- 
2.1.4
