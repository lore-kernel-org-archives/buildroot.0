From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:15:22 +0100
Subject: [Buildroot] [git commit] package/python-yieldfrom: bump to version
 1.0.5
Message-ID: <20191218220628.8CA7C8C5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0db459fe3dd3628a54e9aa6253c8e2f61e7f554b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yieldfrom/python-yieldfrom.hash | 4 ++--
 package/python-yieldfrom/python-yieldfrom.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yieldfrom/python-yieldfrom.hash b/package/python-yieldfrom/python-yieldfrom.hash
index ec7f58e007..7730a1e578 100644
--- a/package/python-yieldfrom/python-yieldfrom.hash
+++ b/package/python-yieldfrom/python-yieldfrom.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yieldfrom/json
-md5	98182ff0e861458e9e3dfaa0d47a47af  yieldfrom-1.0.4.tar.gz
-sha256	09c4e32402ec1c098e66ef5e25e036134f0e84f72ff5817641728707a168f5b3  yieldfrom-1.0.4.tar.gz
+md5	fd94120625ac1e69bb5946d5e63182da  yieldfrom-1.0.5.tar.gz
+sha256	eb75e58641410f06083f85013a438f28bceaabfe5af9c3206d5049362c37aca0  yieldfrom-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256	b3092d61cce29e25f3799285495095d220e5e015b88c1c70e1e72dae052f21e8  LICENSE
diff --git a/package/python-yieldfrom/python-yieldfrom.mk b/package/python-yieldfrom/python-yieldfrom.mk
index 2576a8ced3..c926936ae8 100644
--- a/package/python-yieldfrom/python-yieldfrom.mk
+++ b/package/python-yieldfrom/python-yieldfrom.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YIELDFROM_VERSION = 1.0.4
+PYTHON_YIELDFROM_VERSION = 1.0.5
 PYTHON_YIELDFROM_SOURCE = yieldfrom-$(PYTHON_YIELDFROM_VERSION).tar.gz
-PYTHON_YIELDFROM_SITE = https://files.pythonhosted.org/packages/6e/d2/dc48e4cc6bbe48afd022da745f981cf0437ab7e658de9078bf56747b1d73
+PYTHON_YIELDFROM_SITE = https://files.pythonhosted.org/packages/4d/f9/395917f574ace618eb234bcbae8df3fabaa9624532d96d1fbd3a20678b1e
 PYTHON_YIELDFROM_SETUP_TYPE = setuptools
 PYTHON_YIELDFROM_LICENSE = MIT
 PYTHON_YIELDFROM_LICENSE_FILES = LICENSE
