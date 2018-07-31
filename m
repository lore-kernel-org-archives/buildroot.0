From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:52:02 +0200
Subject: [Buildroot] [git commit] package/python-certifi: bump version to
 2018.4.16
Message-ID: <20180731194702.059038A5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cfeceff3ff74c0a508c4f14e0d6cbd84867937c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package using scanpypi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/Config.in           | 2 +-
 package/python-certifi/python-certifi.hash | 7 ++++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-certifi/Config.in b/package/python-certifi/Config.in
index 9390b4f898..015b8092a9 100644
--- a/package/python-certifi/Config.in
+++ b/package/python-certifi/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_CERTIFI
 	help
 	  Python package for providing Mozilla's CA Bundle.
 
-	  https://pypi.python.org/pypi/certifi
+	  http://certifi.io/
diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index e3e2f07770..2d339dd2d5 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/certifi/json, sha256 locally computed
-md5	068fd5c3c690ae47504b3e0bf4e56c4c  certifi-2018.1.18.tar.gz
-sha256	edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d  certifi-2018.1.18.tar.gz
+# md5, sha256 from https://pypi.org/pypi/certifi/json
+md5	f5d81d0048e84285611412b0dea0630a  certifi-2018.4.16.tar.gz
+sha256	13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7  certifi-2018.4.16.tar.gz
+# Locally computed sha256 checksums
 sha256	6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 084893f5c1..716e6a3840 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2018.1.18
+PYTHON_CERTIFI_VERSION = 2018.4.16
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
