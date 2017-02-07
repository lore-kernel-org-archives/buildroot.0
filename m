From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 14:25:14 +0100
Subject: [Buildroot] [git commit] python-pyopenssl: bump to version 16.2.0
Message-ID: <20170207132545.B2CEB8212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d8209f0eb70126d52b56856d8ed00087007322b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 6 +++---
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 27427d2..894c4f8 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9587d813dcf656e9f2760e41a3682dc3, sha256 locally computed
-md5     9587d813dcf656e9f2760e41a3682dc3  pyOpenSSL-16.0.0.tar.gz
-sha256  363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d  pyOpenSSL-16.0.0.tar.gz
+# md5 from https://pypi.python.org/pypi/pyopenssl/json, sha256 locally computed
+md5     6635503758c65ea6f70d18d1b18e46d5  pyOpenSSL-16.2.0.tar.gz
+sha256  7779a3bbb74e79db234af6a08775568c6769b5821faecf6e2f4143edb227516e  pyOpenSSL-16.2.0.tar.gz
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 7606411..a5312a0 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 16.0.0
+PYTHON_PYOPENSSL_VERSION = 16.2.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/source/p/pyOpenSSL
+PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/0c/d6/b1fe519846a21614fa4f8233361574eddb223e0bc36b182140d916acfb3b
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
