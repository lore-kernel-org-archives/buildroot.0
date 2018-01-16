From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:49:17 +0100
Subject: [Buildroot] [git commit] python-autobahn: bump to version 17.10.1
Message-ID: <20180116225030.3BC8880F98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adbd1fbd300e94578f64acd034566a65ce88c609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-autobahn/python-autobahn.hash | 5 +++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index cae9160..32c9916 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/autobahn/json, sha256 locally computed
-md5	9850702d0078c5a4aa17170afe2f233c  autobahn-0.16.0.tar.gz
-sha256	a1dcb4315a0914da56ec484659816de72dfad229be4ac19fa61bbc0111ada884  autobahn-0.16.0.tar.gz
+md5	f8c8d74bf73644719b751e6fb11dc4a3  autobahn-17.10.1.tar.gz
+sha256	8cf74132a18da149c5ea3dcbb5e055f6f4fe5a0238b33258d29e89bd276a8078  autobahn-17.10.1.tar.gz
+sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index a5e9aee..3ba91c5 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 0.16.0
+PYTHON_AUTOBAHN_VERSION = 17.10.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/68/37/2523309412f0fb93a7784c65e5c5639b4b5d7a84f91374ad6c3c2d5af60b
+PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/e4/2e/01a64212b1eb580d601fa20f146c962235e3493795f46e3b254597ec635d
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
