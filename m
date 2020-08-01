From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  1 Aug 2020 15:35:32 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 3.0
Message-ID: <20200801213532.1493115-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 1323e490dd..c6768ff21a 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5  b1d1802e8874fa7d18e84bfe5607333f  cryptography-2.9.tar.gz
-sha256  0cacd3ef5c604b8e5f59bf2582c076c98a37fe206b31430d0cd08138aff0986e  cryptography-2.9.tar.gz
+md5  163608a7cb838c6b39360e1e64377d54  cryptography-3.0.tar.gz
+sha256  8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053  cryptography-3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 5e58266e64..6eb7be8d5d 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 2.9
+PYTHON_CRYPTOGRAPHY_VERSION = 3.0
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/9d/0a/d7060601834b1a0a84845d6ae2cd59be077aafa2133455062e47c9733024
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.25.1
