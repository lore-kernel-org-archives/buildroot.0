From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  2 Jun 2016 16:05:27 +0200
Subject: [Buildroot] [PATCH 2/5] python-serial: bump to version 3.1
In-Reply-To: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
References: <1464876330-6890-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1464876330-6890-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-serial/python-serial.hash | 6 +++---
 package/python-serial/python-serial.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-serial/python-serial.hash b/package/python-serial/python-serial.hash
index 7400624..f98a8b9 100644
--- a/package/python-serial/python-serial.hash
+++ b/package/python-serial/python-serial.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f94bc6e141d60f17edc7bf8757c4d922, sha256 locally computed
-md5     f94bc6e141d60f17edc7bf8757c4d922  pyserial-3.0.tar.gz
-sha256  056c2d96c83c009d8d04aad43a90f91f10f6a97d42c0d9656c2655c63fb8ff07  pyserial-3.0.tar.gz
+# md5 from http://pypi.python.org/pypi?:action=show_md5&digest=e849af7f8b7ec75cbc7a53da67c51a51, sha256 locally computed
+md5     e849af7f8b7ec75cbc7a53da67c51a51  pyserial-3.1.tar.gz
+sha256  c8ffdcbd8bfd308842409e558848c32aa3499a1bfe95a591e4210072b9520f1e  pyserial-3.1.tar.gz
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index ba871ea..696e207 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIAL_VERSION = 3.0
+PYTHON_SERIAL_VERSION = 3.1
 PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
-PYTHON_SERIAL_SITE = http://pypi.python.org/packages/source/p/pyserial
+PYTHON_SERIAL_SITE = https://pypi.python.org/packages/ce/9c/694ce79a9d4a164e109aeba1a40fba23336f3b7554978553e22a5d41d54d
 PYTHON_SERIAL_LICENSE = Python Software Foundation License
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
-- 
2.8.1
