From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:46:18 +0100
Subject: [Buildroot] [git commit] package/python-msgpack: bump to version
 1.0.0
Message-ID: <20200309140905.5B5A781298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23ae45825f8bc6d5633812ea56359a70b2260d91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-msgpack/python-msgpack.hash | 6 +++---
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index e58537d062..e34ea118ed 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5	ba46fdee995565f40e332bd7eea882f1  msgpack-0.6.2.tar.gz
-sha256	ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830  msgpack-0.6.2.tar.gz
-# Locally computed sha256
+md5  c35ee8f991dad3969884e9585e56ebba  msgpack-1.0.0.tar.gz
+sha256  9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0  msgpack-1.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index f4e059f5ea..18d5a998ff 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 0.6.2
+PYTHON_MSGPACK_VERSION = 1.0.0
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/74/0a/de673c1c987f5779b65ef69052331ec0b0ebd22958bda77a8284be831964
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/e4/4f/057549afbd12fdd5d9aae9df19a6773a3d91988afe7be45b277e8cee2f4d
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
