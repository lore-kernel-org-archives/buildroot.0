From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Oct 2018 14:47:11 +0200
Subject: [Buildroot] [git commit] python-babel: bump to version 2.6.0
Message-ID: <20181016135756.187DC8393B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c52c71d51bbbc0a329cce6ce0ed641b000c13776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-babel/python-babel.hash | 8 +++++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 4d7536799f..a52da012c7 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/Babel/json, sha256 locally computed
-md5	afa20bc55b0e991833030129ad498f35  Babel-2.3.4.tar.gz
-sha256	c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875  Babel-2.3.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/babel/json
+md5	c384ac03026e8fe6f9b90f55201f1bff  Babel-2.6.0.tar.gz
+sha256	8cba50f48c529ca3fa18cf81fa9403be176d374ac4d60738b839122dfaaa3d23  Babel-2.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	178b99c90df898d0bee84bd335f36b679c76fafa9d3c288b4eaea4ebd92d8602  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index d9bd0f048e..a507cceaeb 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.3.4
+PYTHON_BABEL_VERSION = 2.6.0
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://pypi.python.org/packages/6e/96/ba2a2462ed25ca0e651fb7b66e7080f5315f91425a07ea5b34d7c870c114
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/be/cc/9c981b249a455fa0c76338966325fc70b7265521bad641bf2932f77712f4
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
