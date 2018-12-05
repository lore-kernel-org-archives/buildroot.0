From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Dec 2018 22:58:56 +0100
Subject: [Buildroot] [git commit] python-idna: bump to version 2.8
Message-ID: <20181205215531.9AC2687A6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3d318ed30884d76abdcc9f4364d409215158d43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 4b3c84e5d8..ddfd44e97c 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5	0e5bb69018ddef1b9d95f681182be82c  idna-2.7.tar.gz
-sha256	684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16  idna-2.7.tar.gz
+md5    2e9ae0b4a0b26d1747c6127cdb060bc1  idna-2.8.tar.gz
+sha256 c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407  idna-2.8.tar.gz
 # Locally computed sha256 checksums
 sha256	0d4bc7abd48dcfb14e24254ee404066737ff0167144e222914a2113b8794683e  LICENSE.rst
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index d5c57955a3..1dae47bb2b 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.7
+PYTHON_IDNA_VERSION = 2.8
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7
 PYTHON_IDNA_LICENSE =  BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
