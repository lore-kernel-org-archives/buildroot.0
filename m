From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 23:25:08 +0200
Subject: [Buildroot] [git commit] python-tornado: bump to 4.2
Message-ID: <20150618212535.6B9C28185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6242bf34fdba1fbd5ce31859a893ce8b9bb1ad2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add md5 from pypi.python.org.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-tornado/python-tornado.hash |    5 +++--
 package/python-tornado/python-tornado.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 72748ab..88e3956 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  99abd3aede45c93739346ee7384e710120121c3744da155d5cff1c0101702228  tornado-4.1.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c548d7b77a11d523c3d7255bd7fd6df8, sha256 locally computed
+md5     c548d7b77a11d523c3d7255bd7fd6df8 tornado-4.2.tar.gz
+sha256  e8b1207da67dbdceebfb291292b4ef1b547d6171525bec1b366853f923456a5f  tornado-4.2.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 2300579..a8d1f94 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.1
+PYTHON_TORNADO_VERSION = 4.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
 PYTHON_TORNADO_LICENSE = Apache-2.0
