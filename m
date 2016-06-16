From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:50:54 +0200
Subject: [Buildroot] [git commit] python-sdnotify: bump to version 0.3.1
Message-ID: <20160616135058.E867981D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76c1961145a95282b5af326c572d7f4364bae4d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE.txt is now part of the PyPi's archive.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-sdnotify/python-sdnotify.hash | 4 ++--
 package/python-sdnotify/python-sdnotify.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-sdnotify/python-sdnotify.hash b/package/python-sdnotify/python-sdnotify.hash
index 4339c8f..6d3ad6b 100644
--- a/package/python-sdnotify/python-sdnotify.hash
+++ b/package/python-sdnotify/python-sdnotify.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/sdnotify/json
-md5	8e6a6e25560162c113fa54fc3fad98f5  sdnotify-0.3.0.tar.gz
+md5	a182c1ef47e1c6c965771aa3029da16f  sdnotify-0.3.1.tar.gz
 # sha256 calculated by scanpypi
-sha256	55fcaffb239f392ecf5b2211ef65f858b8fbbc857be8ca2b6f27b011db9c2ce6  sdnotify-0.3.0.tar.gz
+sha256	e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a  sdnotify-0.3.1.tar.gz
diff --git a/package/python-sdnotify/python-sdnotify.mk b/package/python-sdnotify/python-sdnotify.mk
index aeeefd7..7c24d32 100644
--- a/package/python-sdnotify/python-sdnotify.mk
+++ b/package/python-sdnotify/python-sdnotify.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SDNOTIFY_VERSION = 0.3.0
+PYTHON_SDNOTIFY_VERSION = 0.3.1
 PYTHON_SDNOTIFY_SOURCE = sdnotify-$(PYTHON_SDNOTIFY_VERSION).tar.gz
-PYTHON_SDNOTIFY_SITE = https://pypi.python.org/packages/6f/ef/d57f930ba403b2e6440bd7ab14dbdd7ce1a1bfb5617bba62a950d04bfa34
+PYTHON_SDNOTIFY_SITE = https://pypi.python.org/packages/57/f9/ae03e3ebc83be0d501cde1f5d6d23dee74f5c2105f2cdb98bff4fa9ada9c
 PYTHON_SDNOTIFY_SETUP_TYPE = distutils
 PYTHON_SDNOTIFY_LICENSE = MIT
+PYTHON_SDNOTIFY_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
