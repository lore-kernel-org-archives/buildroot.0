From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:24 +0200
Subject: [Buildroot] [PATCH 04/28] package/python-bottle: bump version to
	0.12.9
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-bottle/python-bottle.hash | 7 +++----
 package/python-bottle/python-bottle.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 8c7d428..5a589f1 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi/bottle/0.12.7
-md5	ed0b83c9dbbdbde784e7c652d61c59f4	bottle-0.12.7.tar.gz
-# Calculated based on the hash above
-sha256	e3ea2191f06ca51af45bf6ca41ed2d1b2d809ceda0876466879fe205be7b2073	bottle-0.12.7.tar.gz
+# md5 from https://pypi.python.org/pypi/bottle/json, sha256 locally computed
+md5	f5850258a86224a791171e8ecbb66d99  bottle-0.12.9.tar.gz
+sha256	fe0a24b59385596d02df7ae7845fe7d7135eea73799d03348aeb9f3771500051  bottle-0.12.9.tar.gz
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 441419e..ec09398 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.7
+PYTHON_BOTTLE_VERSION = 0.12.9
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
 PYTHON_BOTTLE_LICENSE = MIT
-- 
2.9.3
