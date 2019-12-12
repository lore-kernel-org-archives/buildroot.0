From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:40:43 +0100
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 4.7.1
Message-ID: <20191212203221.C340B8A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bc3c8dd610bb14690f8ff646d44742ab8fff513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 1e7b704626..d60bd64442 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	bee3828781685758410fa0fbcda8c88e  multidict-4.6.1.tar.gz
-sha256	5159c4975931a1a78bf6602bbebaa366747fce0a56cb2111f44789d2c45e379f  multidict-4.6.1.tar.gz
+md5	3d0ee14d81ed3db30f6bbd22a1a60d76  multidict-4.7.1.tar.gz
+sha256	d7b6da08538302c5245cd3103f333655ba7f274915f1f5121c4f4b5fbdb3febe  multidict-4.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index e3df5a64bf..ccf78b688f 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.6.1
+PYTHON_MULTIDICT_VERSION = 4.7.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/8a/74/61547af55c077b8d2e3648c2af74c08fa1e382665b290468db7ba54db2ea
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/34/68/38290d44ea34dae6d52719f0c94bd09951387cec75e36cdce6805b5f27e9
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
