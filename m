From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:31:39 +0200
Subject: [Buildroot] [git commit] package/python-typing: bump to version
 3.7.4.1
Message-ID: <20191012132544.2D4468D481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16385ba7b0f20ed3c31422022724f52424de047a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing/python-typing.hash | 4 ++--
 package/python-typing/python-typing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing/python-typing.hash b/package/python-typing/python-typing.hash
index 5bdb8c62e8..8796a4c2e3 100644
--- a/package/python-typing/python-typing.hash
+++ b/package/python-typing/python-typing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing/json
-md5	64614206b4bdc0864fc0e0bccd69efc9  typing-3.6.6.tar.gz
-sha256	4027c5f6127a6267a435201981ba156de91ad0d1d98e9ddc2aa173453453492d  typing-3.6.6.tar.gz
+md5	0a1ebd4af65b4769e33459004eb20345  typing-3.7.4.1.tar.gz
+sha256	91dfe6f3f706ee8cc32d38edbbf304e9b7583fb37108fef38229617f8b3eba23  typing-3.7.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256	ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
index 663227dfc9..6894481243 100644
--- a/package/python-typing/python-typing.mk
+++ b/package/python-typing/python-typing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_VERSION = 3.6.6
+PYTHON_TYPING_VERSION = 3.7.4.1
 PYTHON_TYPING_SOURCE = typing-$(PYTHON_TYPING_VERSION).tar.gz
-PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/bf/9b/2bf84e841575b633d8d91ad923e198a415e3901f228715524689495b4317
+PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/67/b0/b2ea2bd67bfb80ea5d12a5baa1d12bda002cab3b6c9b48f7708cd40c34bf
 PYTHON_TYPING_SETUP_TYPE = setuptools
 PYTHON_TYPING_LICENSE = Python-2.0, others
 PYTHON_TYPING_LICENSE_FILES = LICENSE
