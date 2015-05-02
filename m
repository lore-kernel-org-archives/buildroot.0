From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 09:11:28 +0200
Subject: [Buildroot] [git commit] python-pyxml: fix <pkg>_LICENSE_FILES
Message-ID: <20150502071150.912B48055B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c3862c07548c0bc43858eeec12d9ede645163b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/972/9727fdeccc6df40c791f8ab31a606e0a8caedb87/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyxml/python-xml.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyxml/python-xml.mk b/package/python-pyxml/python-xml.mk
index bfe2c89..77863f5 100644
--- a/package/python-pyxml/python-xml.mk
+++ b/package/python-pyxml/python-xml.mk
@@ -8,7 +8,7 @@ PYTHON_PYXML_VERSION = 0.8.4
 PYTHON_PYXML_SOURCE = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
 PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/0.8.4/
 PYTHON_PYXML_LICENSE = BSD-3c
-PYTHON_PYXML_LICENSE_FILES = LICENSE
+PYTHON_PYXML_LICENSE_FILES = LICENCE
 PYTHON_PYXML_SETUP_TYPE = distutils
 PYTHON_PYXML_DEPENDENCIES = expat
 PYTHON_PYXML_BUILD_OPTS = --with-libexpat=$(STAGING_DIR)/usr
