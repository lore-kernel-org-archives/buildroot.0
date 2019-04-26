From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:05:45 +0200
Subject: [Buildroot] [git commit] package/python-psutil: bump to version
 5.6.2
Message-ID: <20190426070349.DC24081327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e355427844754bacb47dccc68e4a7082d4f2a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index dea94d43fc..a7d49a9ab6 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	765a4179f02c149794a6e99d890dfa4b  psutil-5.6.1.tar.gz
-sha256	fa0a570e0a30b9dd618bffbece590ae15726b47f9f1eaf7518dfb35f4d7dcd21  psutil-5.6.1.tar.gz
+md5	571962acd249bcfbae317884af47c402  psutil-5.6.2.tar.gz
+sha256	828e1c3ca6756c54ac00f1427fdac8b12e21b8a068c3bb9b631a1734cada25ed  psutil-5.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 3a6e7961bc..ed1a9051c8 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.6.1
+PYTHON_PSUTIL_VERSION = 5.6.2
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/2f/b8/11ec5006d2ec2998cb68349b8d1317c24c284cf918ecd6729739388e4c56
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c6/c1/beed5e4eaa1345901b595048fab1c85aee647ea0fc02d9e8bf9aceb81078
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
