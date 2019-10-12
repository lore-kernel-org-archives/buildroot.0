From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:42:17 +0200
Subject: [Buildroot] [git commit] package/python-h2: bump to version 3.1.1
Message-ID: <20191012140839.0ECFB8D690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9400a6205eb704d625cc3e9a2d3e268d60310c28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-h2/python-h2.hash | 8 +++++---
 package/python-h2/python-h2.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index e34f7beb90..1d5df8878d 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/h2/json, sha256 locally computed
-md5	586686662928c2851eb0f1fe99bf279d  h2-3.0.1.tar.gz
-sha256	b2962f883fa392a23cbfcc4ad03c335bcc661be0cf9627657b589f0df2206e64  h2-3.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/h2/json
+md5	950b5a62a2a608dc4547a01edf99aa8f  h2-3.1.1.tar.gz
+sha256	b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4  h2-3.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256	663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index 37f0156458..0043ee2d50 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 3.0.1
+PYTHON_H2_VERSION = 3.1.1
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://pypi.python.org/packages/3c/86/aebb88df3c87255cfd0ffd338608fbfb34d1c850750a486e7f05b013e5a3
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/56/73/0bc3a2f4238bdfbd9b0dc41a972fb558d96e8580ef2a37129ee5a54fa04e
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
