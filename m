From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 20:29:19 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to version
 1.0.0
Message-ID: <20201123032919.2086054-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiorwlock/python-aiorwlock.hash | 6 +++---
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index 8556f5ebd3..2398b15424 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5	8eccf28315b4f851f6f7e9332edeec52  aiorwlock-0.6.0.tar.gz
-sha256	cd310f33a7ea3bf6fd76fcf0c1ba6e4d7eef4d5ded59e95859494425fb7e599d  aiorwlock-0.6.0.tar.gz
+md5  8d89ed0d80820aad8d9320204779fd62  aiorwlock-1.0.0.tar.gz
+sha256  4f773e31d78037e3ec27056a22200af482768b43da66e2cc33dd64aa5ea6518a  aiorwlock-1.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	56fb2baf14d84c59c15abbfbb1fdf30a724017e2ce97894a8236764513d10397  LICENSE
+sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index 48e74c02fd..f6f3c97404 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 0.6.0
+PYTHON_AIORWLOCK_VERSION = 1.0.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/77/cf/2a2584c4fc1096ae959d7d189f205eb9c872ec58aca2cde16009d2d83b9e
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/40/af/e55b3266352f3383c723e0a3304b0df46a59dfc6235b0b1a0a416afd60c1
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
-- 
2.25.1
