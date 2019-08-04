From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 12:07:47 +0200
Subject: [Buildroot] [git commit] package/python-urllib3: bump version to
 1.25.3
Message-ID: <20190804100514.EDC648DFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335b32587d69b531b2d6d67f4e11f69b63ea4337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash after upstream commit:
https://github.com/urllib3/urllib3/commit/2a0957ea27e966166f81f88693af8e2f87d19fb6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index ec075cb4f6..e61f754aa3 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5	20bb5a170a534bd0acd98bfc007fcc22  urllib3-1.24.2.tar.gz
-sha256	9a247273df709c4fedb38c711e44292304f73f39ab01beda9f6b9fc375669ac3  urllib3-1.24.2.tar.gz
+md5	f09e95a5c42a7cc7ff7cb6a14c55fb69  urllib3-1.25.3.tar.gz
+sha256	dbe59173209418ae49d485b87d1681aefa36252ee85884c31346debd19463232  urllib3-1.25.3.tar.gz
 # Locally computed sha256 checksums
-sha256	11db569430ca5ad793f1399297b8df5041a22137abaf90642ea71da21d59121c  LICENSE.txt
+sha256	7c0d136ee0585389adf2d25671bb99687a1f75929f465b7f16ee3f01da37255e  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 893d32d976..5d8ec34f39 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.24.2
+PYTHON_URLLIB3_VERSION = 1.25.3
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/fd/fa/b21f4f03176463a6cccdb612a5ff71b927e5224e83483012747c12fc5d62
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/4c/13/2386233f7ee40aa8444b47f7463338f3cbdf00c316627558784e3f542f07
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
