From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:08:28 +0100
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 4.5.2
Message-ID: <20181202071600.38519803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=660cf556b9228e87d85773673cc610991f3ced17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 18f12271ab..a98c4553d4 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	c3d21070fa87a15a1e3388dc5cf47ad5  multidict-4.5.0.tar.gz
-sha256	3fa7944194cc96319cbbd53a1e0fb6dfe1e437efb75117828c35ce5b30d9d0c9  multidict-4.5.0.tar.gz
+md5	5e9d8f7e1ada9a22932aed6a72f88e43  multidict-4.5.2.tar.gz
+sha256	024b8129695a952ebd93373e45b5d341dbb87c17ce49637b34000093f243dd4f  multidict-4.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index d25a51f8ad..7b9cd39283 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.5.0
+PYTHON_MULTIDICT_VERSION = 4.5.2
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/70/b0/f6ce77f952b773eea2926ffacd031f9e95eeabd531dce999dceb8841fffc
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/7f/8f/b3c8c5b062309e854ce5b726fc101195fbaa881d306ffa5c2ba19efa3af2
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
