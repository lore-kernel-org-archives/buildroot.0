From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:27:14 +0200
Subject: [Buildroot] [git commit] python-txaio: bump to version 2.8.0
Message-ID: <20170706192410.6108A81F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afe1f5cd566b70bbbe9997d2f862b3daf16f6880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 37da82b..f19014c 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/txaio/json, sha256 locally computed.
-md5	7b0f5321515d380ad5d32f01666b6ee7  txaio-2.5.1.tar.gz
-sha256	625076477182e2dde78b79d0b2b0d6b3cecb0e24fe0ea7eaf2abd26a4c0dd1de  txaio-2.5.1.tar.gz
+md5	643ac20b895b878786cd6a46790367d0  txaio-2.8.0.tar.gz
+sha256	8029d956591107ff9a2221d2a288fdd3718713a6991f59b97359d3d4f4b7b564  txaio-2.8.0.tar.gz
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 34c6e99..e0f5e28 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 2.5.1
+PYTHON_TXAIO_VERSION = 2.8.0
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://pypi.python.org/packages/45/e1/f7d88767d65dbfc20d4b4aa0dad657dbbe8ca629ead2bef24da04630a12a
+PYTHON_TXAIO_SITE = https://pypi.python.org/packages/03/86/2cb7ae81209cc3fc64f68a31d70c20ab4771b520d7e13a5219b1f5e16ee1
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
