From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:07:50 +0200
Subject: [Buildroot] [git commit] package/python-toml: bump to version 0.10.0
Message-ID: <20191010200238.8C5EE8C701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aaaa1fc5ce86a080b53a4d897cb78ed4db2f095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-toml/python-toml.hash | 7 +++++--
 package/python-toml/python-toml.mk   | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/python-toml/python-toml.hash b/package/python-toml/python-toml.hash
index 20737c3ca4..f0641ccda8 100644
--- a/package/python-toml/python-toml.hash
+++ b/package/python-toml/python-toml.hash
@@ -1,2 +1,5 @@
-# Locally computed
-sha256	633a90ecb1f5665b58f0c94153fcf519313ef53e1de0eac90929cd6b6a014235  python-toml-0.9.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/toml/json
+md5	63fffbe2d632865ec29cd69bfdf36682  toml-0.10.0.tar.gz
+sha256	229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c  toml-0.10.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a879cc43c06aca11ada36f71c8db7257449ff4451874a0903f129920c66fcf2d  LICENSE
diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index fae15f938d..b4f9070f24 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOML_VERSION = 0.9.3
-PYTHON_TOML_SITE = $(call github,uiri,toml,$(PYTHON_TOML_VERSION))
+PYTHON_TOML_VERSION = 0.10.0
+PYTHON_TOML_SOURCE = toml-$(PYTHON_TOML_VERSION).tar.gz
+PYTHON_TOML_SITE = https://files.pythonhosted.org/packages/b9/19/5cbd78eac8b1783671c40e34bb0fa83133a06d340a38b55c645076d40094
 PYTHON_TOML_SETUP_TYPE = setuptools
 PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
