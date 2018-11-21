From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 21:08:36 +0100
Subject: [Buildroot] [git commit] python-multidict: bump to verision 4.5.0
Message-ID: <20181202071557.047E98843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2e8330deb257b59d7c29a3460e8beb52ca7571d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index aa15eed1c7..18f12271ab 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	55d19168f955e5463c6f6b530e913da3  multidict-4.4.2.tar.gz
-sha256	3c11e92c3dfc321014e22fb442bc9eb70e01af30d6ce442026b0c35723448c66  multidict-4.4.2.tar.gz
+md5	c3d21070fa87a15a1e3388dc5cf47ad5  multidict-4.5.0.tar.gz
+sha256	3fa7944194cc96319cbbd53a1e0fb6dfe1e437efb75117828c35ce5b30d9d0c9  multidict-4.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index f88135cb69..d25a51f8ad 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.4.2
+PYTHON_MULTIDICT_VERSION = 4.5.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b3/5f/5c29cde8511c95fad045b9ecaf2e76f0da18761e8363a82594f5a58c2ced
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/70/b0/f6ce77f952b773eea2926ffacd031f9e95eeabd531dce999dceb8841fffc
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
