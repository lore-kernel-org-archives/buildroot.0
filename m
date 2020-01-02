From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:16:27 +0100
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 4.7.3
Message-ID: <20200102080654.284D18EB51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06b0528319505c7282bbb6acbde29dd12c51d914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 0a6315280b..b0c53f49af 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	6e021381611e08839c2820b9778a8e85  multidict-4.7.2.tar.gz
-sha256	d4dafdcfbf0ac80fc5f00603f0ce43e487c654ae34a656e4749f175d9832b1b5  multidict-4.7.2.tar.gz
+md5	bafb3123d53853790871f657a96491d3  multidict-4.7.3.tar.gz
+sha256	be813fb9e5ce41a5a99a29cdb857144a1bd6670883586f995b940a4878dc5238  multidict-4.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index ddf8086dfb..2190e501cc 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.7.2
+PYTHON_MULTIDICT_VERSION = 4.7.3
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/ec/1b/a117d6cb4403f2b64633606e3767f65fa8897b7db6efe14391c7b96cf2f6
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/84/96/5503ba866d8d216e49a6ce3bcb288df8a5fb3ac8a90b8fcff9ddcda32568
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
