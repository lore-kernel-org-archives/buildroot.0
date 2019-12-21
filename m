From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:09:13 +0100
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 4.7.2
Message-ID: <20191221220010.9DB8C8D3CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=135fa1743173f1a930fc0e76de1527debff13ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index d60bd64442..0a6315280b 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	3d0ee14d81ed3db30f6bbd22a1a60d76  multidict-4.7.1.tar.gz
-sha256	d7b6da08538302c5245cd3103f333655ba7f274915f1f5121c4f4b5fbdb3febe  multidict-4.7.1.tar.gz
+md5	6e021381611e08839c2820b9778a8e85  multidict-4.7.2.tar.gz
+sha256	d4dafdcfbf0ac80fc5f00603f0ce43e487c654ae34a656e4749f175d9832b1b5  multidict-4.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index ccf78b688f..ddf8086dfb 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.7.1
+PYTHON_MULTIDICT_VERSION = 4.7.2
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/34/68/38290d44ea34dae6d52719f0c94bd09951387cec75e36cdce6805b5f27e9
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/ec/1b/a117d6cb4403f2b64633606e3767f65fa8897b7db6efe14391c7b96cf2f6
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
