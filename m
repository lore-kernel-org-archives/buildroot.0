From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:42:22 +0200
Subject: [Buildroot] [git commit] package/python-subprocess32: bump to
 version 3.5.4
Message-ID: <20191012140839.1777B8D690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cf04c1ae6a3d5650e3d7e1666fe0ec318482e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-subprocess32/python-subprocess32.hash | 4 ++--
 package/python-subprocess32/python-subprocess32.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-subprocess32/python-subprocess32.hash b/package/python-subprocess32/python-subprocess32.hash
index e96505d3d4..65d18763d1 100644
--- a/package/python-subprocess32/python-subprocess32.hash
+++ b/package/python-subprocess32/python-subprocess32.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/subprocess32/json
-md5	afa0510115f483d668e25aa30502d9bc  subprocess32-3.5.3.tar.gz
-sha256	6bc82992316eef3ccff319b5033809801c0c3372709c5f6985299c88ac7225c3  subprocess32-3.5.3.tar.gz
+md5	748844d560be5f0c707931cba1cdb48b  subprocess32-3.5.4.tar.gz
+sha256	eb2937c80497978d181efa1b839ec2d9622cf9600a039a79d0e108d1f9aec79d  subprocess32-3.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256	826b43437249d39422642f695154d064da64de92eb1476048a615f50bc1beb4a  LICENSE
diff --git a/package/python-subprocess32/python-subprocess32.mk b/package/python-subprocess32/python-subprocess32.mk
index d6c57fb8bd..ee591e6a6b 100644
--- a/package/python-subprocess32/python-subprocess32.mk
+++ b/package/python-subprocess32/python-subprocess32.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SUBPROCESS32_VERSION = 3.5.3
+PYTHON_SUBPROCESS32_VERSION = 3.5.4
 PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz
-PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/be/2b/beeba583e9877e64db10b52a96915afc0feabf7144dcbf2a0d0ea68bf73d
+PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/32/c8/564be4d12629b912ea431f1a50eb8b3b9d00f1a0b1ceff17f266be190007
 PYTHON_SUBPROCESS32_SETUP_TYPE = setuptools
 PYTHON_SUBPROCESS32_LICENSE = Python-2.0
 PYTHON_SUBPROCESS32_LICENSE_FILES = LICENSE
