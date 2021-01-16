From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:36:25 +0100
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.19.48
Message-ID: <20210116211740.A5E89874FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08be3e83270cd8aaf529fb69a69757ba836ae7fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rapha??l M??lotte <raphael.melotte@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 446c67f833..afaac12bde 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  a75ae28d58d64dbf689d18ac3424342a  botocore-1.12.210.tar.gz
-sha256  7983b7624b3f71648a7101fbcb437e3d599b4f79b754e89220e574482a2f8298  botocore-1.12.210.tar.gz
+md5  870be84c9b418430ad9d0cb5640e76ef  botocore-1.12.210.tar.gz
+sha256  b954c596f8bdf31d5fdf1eff8a2296bde8094e1e22961a79b83bb62ddeba8a49  botocore-1.19.48.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 378bd93768..76c59d0a2d 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.12.210
+PYTHON_BOTOCORE_VERSION = 1.19.48
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/39/78/068e7cf5bb9901f34eacbf449cdfbdf32e470333930cbcda890cfc9fb820
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/73/c6fe3fafb74cc86a2a9ddf565a2b8956777e668c6248927e6d76b66f61a4
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
