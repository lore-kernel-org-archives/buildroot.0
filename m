From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Jan 2020 15:31:13 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 4.7.4
Message-ID: <20200115223113.77797-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index b0c53f49af..02e1c1ef51 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	bafb3123d53853790871f657a96491d3  multidict-4.7.3.tar.gz
-sha256	be813fb9e5ce41a5a99a29cdb857144a1bd6670883586f995b940a4878dc5238  multidict-4.7.3.tar.gz
+md5	22b46f759cf2cc3ca1d2c9f82cc9bb79  multidict-4.7.4.tar.gz
+sha256	d7d428488c67b09b26928950a395e41cc72bb9c3d5abfe9f0521940ee4f796d4  multidict-4.7.4.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 2190e501cc..10aa556aa1 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.7.3
+PYTHON_MULTIDICT_VERSION = 4.7.4
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/84/96/5503ba866d8d216e49a6ce3bcb288df8a5fb3ac8a90b8fcff9ddcda32568
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b6/22/ae21cedaa0e6d35e84e8ab57700dcf3d4609421ebe113e1aaafc468eec42
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.20.1
