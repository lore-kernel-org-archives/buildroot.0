From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:04:31 +0200
Subject: [Buildroot] [git commit] package/python-bcrypt: bump to version
 3.1.7
Message-ID: <20191002201426.50B7781E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=185904ed256f909aa8591e3501c9ac81fd335f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bcrypt/python-bcrypt.hash | 4 ++--
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 3e4c303a1f..a9c070f2e1 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bcrypt/json
-md5	4d8ab82e5e0c86b15f4ba5aff2bec6b5  bcrypt-3.1.6.tar.gz
-sha256	44636759d222baa62806bbceb20e96f75a015a6381690d1bc2eda91c01ec02ea  bcrypt-3.1.6.tar.gz
+md5	5d6f93b575ce52470af37a8e7dce76fe  bcrypt-3.1.7.tar.gz
+sha256	0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42  bcrypt-3.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256	8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index 71bf036fce..381d003475 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.1.6
+PYTHON_BCRYPT_VERSION = 3.1.7
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/ce/3a/3d540b9f5ee8d92ce757eebacf167b9deedb8e30aedec69a2a072b2399bb
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/fa/aa/025a3ab62469b5167bc397837c9ffc486c42a97ef12ceaa6699d8f5a5416
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
