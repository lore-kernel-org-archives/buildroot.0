From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:39:12 +0200
Subject: [Buildroot] [git commit] package/python-tornado: bump version to
 6.0.4
Message-ID: <20200425132443.2FD868FFAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e431e04c90dbe6434e26b6f8acd92620a21c71e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert the hash file to using the two space format for hashes. The
has for the LICENSE file has been updated since version 6.0.4 now
includes DOS line endings (\r\n).

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tornado/python-tornado.hash | 6 +++---
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 2aec0144e6..e9fbbedf65 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5	cab4b11480f6d032e46465586192d343  tornado-6.0.3.tar.gz
-sha256	c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9  tornado-6.0.3.tar.gz
+md5  cf39425f3d7eba9a54287f3e795a2f23  tornado-6.0.4.tar.gz
+sha256  0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc  tornado-6.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index e326fadcb5..15f3b83689 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.0.3
+PYTHON_TORNADO_VERSION = 6.0.4
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/30/78/2d2823598496127b21423baffaa186b668f73cd91887fcef78b6eade136b
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/95/84/119a46d494f008969bf0c775cb2c6b3579d3c4cc1bb1b41a022aa93ee242
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_SETUP_TYPE = setuptools
