From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:33:08 +0100
Subject: [Buildroot] [git commit] python-pyopenssl: bump to version 16.0.0
Message-ID: <20160324213322.7F428819ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a7f8da264f894d1f499a9cf26f0b5b8c1221e57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 6 +++---
 package/python-pyopenssl/python-pyopenssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 0c6e25a..27427d2 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f447644afcbd5f0a1f47350fec63a4c6, sha256 locally computed
-md5     f447644afcbd5f0a1f47350fec63a4c6  pyOpenSSL-0.15.1.tar.gz
-sha256  f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672  pyOpenSSL-0.15.1.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9587d813dcf656e9f2760e41a3682dc3, sha256 locally computed
+md5     9587d813dcf656e9f2760e41a3682dc3  pyOpenSSL-16.0.0.tar.gz
+sha256  363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d  pyOpenSSL-16.0.0.tar.gz
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 239fd98..7606411 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 0.15.1
+PYTHON_PYOPENSSL_VERSION = 16.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
 PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/source/p/pyOpenSSL
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
