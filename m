From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 11:17:38 +0200
Subject: [Buildroot] [git commit] package/python-certifi: bump version to
 2019.6.16
Message-ID: <20190804092123.222C48DEFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d16c3b9804b01354583ddf35a22e100f78f623c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated project URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/Config.in           | 2 +-
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/Config.in b/package/python-certifi/Config.in
index 015b8092a9..efa7a89397 100644
--- a/package/python-certifi/Config.in
+++ b/package/python-certifi/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_CERTIFI
 	help
 	  Python package for providing Mozilla's CA Bundle.
 
-	  http://certifi.io/
+	  https://certifi.io/
diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 3d0e48f6c2..57fe9dc641 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5	8160cf662212bc731eccf1af8042c0af  certifi-2018.11.29.tar.gz
-sha256	47f9c83ef4c0c621eaef743f133f09fa8a74a9b75f037e8624f83bd1b6626cb7  certifi-2018.11.29.tar.gz
+md5	af8fea5f3df6f7f81e9c6cbc6dd7c1e8  certifi-2019.6.16.tar.gz
+sha256	945e3ba63a0b9f577b1395204e13c3a231f9bc0223888be653286534e5873695  certifi-2019.6.16.tar.gz
 # Locally computed sha256 checksums
 sha256	6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 29b646922a..f8a6706615 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2018.11.29
+PYTHON_CERTIFI_VERSION = 2019.6.16
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/55/54/3ce77783acba5979ce16674fc98b1920d00b01d337cfaaf5db22543505ed
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/c5/67/5d0548226bcc34468e23a0333978f0e23d28d0b3f0c71a151aef9c3f7680
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
