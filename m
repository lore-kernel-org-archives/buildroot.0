From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 14:12:13 +0200
Subject: [Buildroot] [git commit] python-tomako: bump to version 0.1.0.post1
Message-ID: <20160711121221.1CBA0818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2dacf7e07cc0434475518e6f57863c829e16d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-tomako/python-tomako.hash | 7 +++----
 package/python-tomako/python-tomako.mk   | 5 +++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-tomako/python-tomako.hash b/package/python-tomako/python-tomako.hash
index 678944a..af07a88 100644
--- a/package/python-tomako/python-tomako.hash
+++ b/package/python-tomako/python-tomako.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/tomako/json
-md5	74597762d156f52b8716aced94d51f2a  tomako-0.1.0.tar.gz
-# sha256 calculated by scanpypi
-sha256	e541e6bad009d3f61956b135757d491bf42c97cb441e7c11ef7a0ef6e9460a9f  tomako-0.1.0.tar.gz
+# md5 from https://pypi.python.org/pypi/tomako/json, sha256 locally computed
+md5	a2e9e99be4ddf2263ed441ddc3dfcf96  tomako-0.1.0.post1.tar.gz
+sha256	2d8ec113199408eb16ec00361aac6f10b716925779b6331083f304d01dafd150  tomako-0.1.0.post1.tar.gz
diff --git a/package/python-tomako/python-tomako.mk b/package/python-tomako/python-tomako.mk
index a9eef64..23c0b34 100644
--- a/package/python-tomako/python-tomako.mk
+++ b/package/python-tomako/python-tomako.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TOMAKO_VERSION = 0.1.0
+PYTHON_TOMAKO_VERSION = 0.1.0.post1
 PYTHON_TOMAKO_SOURCE = tomako-$(PYTHON_TOMAKO_VERSION).tar.gz
-PYTHON_TOMAKO_SITE = https://pypi.python.org/packages/66/6f/de5449d401ca6953691c765d7465941e772cf99a3547646edc58cdca452d
+PYTHON_TOMAKO_SITE = https://pypi.python.org/packages/30/64/e174248281cb2fa8f5bce955d4bd49b253e622bb540a6001e48dec378a07
 PYTHON_TOMAKO_SETUP_TYPE = setuptools
 PYTHON_TOMAKO_LICENSE = MIT
+PYTHON_TOMAKO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
