From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 23:07:05 +0100
Subject: [Buildroot] [git commit] python-bcrypt: bump to version 3.1.6
Message-ID: <20190119220733.C0F0B890FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f897d368c256b0ff43321b65021004ccb513542b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bcrypt/python-bcrypt.hash | 4 ++--
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 14933a6187..3e4c303a1f 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bcrypt/json
-md5	7b441a7cdabf6d6f8ad44af2c0a91ab6  bcrypt-3.1.5.tar.gz
-sha256	136243dc44e5bab9b61206bd46fff3018bd80980b1a1dfbab64a22ff5745957f  bcrypt-3.1.5.tar.gz
+md5	4d8ab82e5e0c86b15f4ba5aff2bec6b5  bcrypt-3.1.6.tar.gz
+sha256	44636759d222baa62806bbceb20e96f75a015a6381690d1bc2eda91c01ec02ea  bcrypt-3.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256	8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index 8d25795656..71bf036fce 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.1.5
+PYTHON_BCRYPT_VERSION = 3.1.6
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/91/a5/fd19eac0252e56b4ce65ced937ae40024782c21108da7d830003b7f76cdb
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/ce/3a/3d540b9f5ee8d92ce757eebacf167b9deedb8e30aedec69a2a072b2399bb
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
