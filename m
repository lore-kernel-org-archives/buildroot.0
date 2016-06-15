From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 15 Jun 2016 12:09:17 +0200
Subject: [Buildroot] [PATCH 4/5] python-twisted: bump to version 16.2.0
In-Reply-To: <1465985358-12555-1-git-send-email-yegorslists@googlemail.com>
References: <1465985358-12555-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1465985358-12555-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 275cea8..8836a10 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=266a085f5ce3fbc060818bd00bd6a888, sha256 locally computed
-md5     266a085f5ce3fbc060818bd00bd6a888 Twisted-16.1.1.tar.bz2
-sha256  fe7d001d9a803ed26cd0fd2f69fa4212ff025f3af6ef1a559d905fe551ab04e9  Twisted-16.1.1.tar.bz2
+# md5 from https://pypi.python.org/pypi/Twisted/json, sha256 locally computed.
+md5     8b35a88d5f1a4bfd762a008968fddabf  Twisted-16.2.0.tar.bz2
+sha256  a090e8dc675e97fb20c3bb5f8114ae94169f4e29fd3b3cbede35705fd3cdbd79  Twisted-16.2.0.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index e98e03f..3c45d01 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 16.1.1
+PYTHON_TWISTED_VERSION = 16.2.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/source/T/Twisted
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/18/85/eb7af503356e933061bf1220033c3a85bad0dbc5035dfd9a97f1e900dfcb
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.8.1
