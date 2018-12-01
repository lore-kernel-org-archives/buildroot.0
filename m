From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:10:48 +0100
Subject: [Buildroot] [git commit branch/next] package/python-msgpack: bump
 to version 0.6.0
Message-ID: <20181201210725.57BF2889BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a9a4c0b4eda036a3003176e9cbb0794327eaba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Archive file name changed from msgpack-python to msgpack

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-msgpack/python-msgpack.hash | 6 +++---
 package/python-msgpack/python-msgpack.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 74785837d8..98027009ad 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/msgpack-python/json
-md5	6d644c06a87a5a111bbbf5b34b4be440  msgpack-python-0.5.6.tar.gz
-sha256	378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b  msgpack-python-0.5.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/msgpack/json
+md5	be3043cc2c1e3b5ebf08463ffa71cf17  msgpack-0.6.0.tar.gz
+sha256	64abc6bf3a2ac301702f5760f4e6e227d0fd4d84d9014ef9a40faa9d43365259  msgpack-0.6.0.tar.gz
 # Locally computed sha256
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index e0544f5d33..8bbae9283d 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 0.5.6
-PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/8a/20/6eca772d1a5830336f84aca1d8198e5a3f4715cd1c7fc36d3cc7f7185091
+PYTHON_MSGPACK_VERSION = 0.6.0
+PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/3a/bb/dc3f9fc608a6c1c7a471c2bebc761d9c8dbb2f7179a4283a89b9451765b5
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
