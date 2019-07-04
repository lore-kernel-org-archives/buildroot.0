From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 07:54:05 +0200
Subject: [Buildroot] [git commit] package/python-libusb1: bump to version
 1.7.1
Message-ID: <20190704060000.7CA6C7FC8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3be30c9df396ff3ff8169ecce8bb933355e6b95c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://pypi.org/project/libusb1/#id40

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index 3649872eca..21f4840601 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/libusb1/json, sha256 locally computed
-md5	9c2eb6032deda59f287a443091d38cb4  libusb1-1.6.4.tar.gz
-sha256	8c930d9c1d037d9c83924c82608aa6a1adcaa01ca0e4a23ee0e8e18d7eee670d  libusb1-1.6.4.tar.gz
+md5	cb4073182fef4cee6ab9c6666b48d1a1  libusb1-1.7.1.tar.gz
+sha256	adf64a4f3f5c94643a1286f8153bcf4bc787c348b38934aacd7fe17fbeebc571  libusb1-1.7.1.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 3329764fef..075f50f418 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 1.6.4
+PYTHON_LIBUSB1_VERSION = 1.7.1
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://pypi.python.org/packages/ec/5d/4fdac6c53525786fe35cff035c3345452e24e2bee5627893be65d12555cb
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/80/bb/4ee9d760dd29499d877ee384f1d2bc6bb9923defd4c69843aef5e729972d
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
