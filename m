From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:36:32 +0200
Subject: [Buildroot] [git commit] package/python-typing: bump to version
 3.10.0.0
Message-ID: <20210703210359.29AFF8F683@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c5fcad353d6d2964d4664be31cc442ac800df3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing/python-typing.hash | 4 ++--
 package/python-typing/python-typing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing/python-typing.hash b/package/python-typing/python-typing.hash
index 438ecb0727..f587eb7bfa 100644
--- a/package/python-typing/python-typing.hash
+++ b/package/python-typing/python-typing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing/json
-md5  276296e7b6b617d4f8b5e8874f240bd4  typing-3.7.4.3.tar.gz
-sha256  1187fb9c82fd670d10aa07bbb6cfcfe4bdda42d6fab8d5134f04e8c4d0b71cc9  typing-3.7.4.3.tar.gz
+md5  d6dd450cfe0c8c6547eef09a0491775d  typing-3.10.0.0.tar.gz
+sha256  13b4ad211f54ddbf93e5901a9967b1e07720c1d1b78d596ac6a439641aa1b130  typing-3.10.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing/python-typing.mk b/package/python-typing/python-typing.mk
index efb2196286..dd1d8f29b5 100644
--- a/package/python-typing/python-typing.mk
+++ b/package/python-typing/python-typing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_VERSION = 3.7.4.3
+PYTHON_TYPING_VERSION = 3.10.0.0
 PYTHON_TYPING_SOURCE = typing-$(PYTHON_TYPING_VERSION).tar.gz
-PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/05/d9/6eebe19d46bd05360c9a9aae822e67a80f9242aabbfc58b641b957546607
+PYTHON_TYPING_SITE = https://files.pythonhosted.org/packages/b0/1b/835d4431805939d2996f8772aca1d2313a57e8860fec0e48e8e7dfe3a477
 PYTHON_TYPING_SETUP_TYPE = setuptools
 PYTHON_TYPING_LICENSE = Python-2.0, others
 PYTHON_TYPING_LICENSE_FILES = LICENSE
