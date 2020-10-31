From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 21:44:00 +0100
Subject: [Buildroot] [git commit] package/python-urllib3: bump to version
 1.25.11
Message-ID: <20201031204918.25FDA86387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=822c283edcb7ee1df83cb4f4e367fba73e4391fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 5 +++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 6be3671a3c..e29966672a 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/urllib3/json
-sha256	91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a  urllib3-1.25.10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/urllib3/json
+md5  d47dd21a6e66a03c3633cac468ffd010  urllib3-1.25.11.tar.gz
+sha256  8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2  urllib3-1.25.11.tar.gz
 # Locally computed sha256 checksums
 sha256	7c0d136ee0585389adf2d25671bb99687a1f75929f465b7f16ee3f01da37255e  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index e64ff136ab..88e8d2097b 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.25.10
+PYTHON_URLLIB3_VERSION = 1.25.11
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/81/f4/87467aeb3afc4a6056e1fe86626d259ab97e1213b1dfec14c7cb5f538bf0
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/76/d9/bbbafc76b18da706451fa91bc2ebe21c0daf8868ef3c30b869ac7cb7f01d
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
