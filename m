From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 22:59:12 +0200
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2021.5.30
Message-ID: <20210716202900.F2C419111F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d5534404ef67d94d297aa904557553781b8e712a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to typo fix:
https://github.com/certifi/python-certifi/commit/c5311ad0533e78240f34b0e35451794d0e261d54

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 7605672514..ae122ffc23 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  522f9abe26e5d603a668d812aa6accca  certifi-2020.12.5.tar.gz
-sha256  1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c  certifi-2020.12.5.tar.gz
+md5  4b38238b7305fcb3ffbc4368be4e8845  certifi-2021.5.30.tar.gz
+sha256  2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee  certifi-2021.5.30.tar.gz
 # Locally computed sha256 checksums
-sha256  6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
+sha256  be9d82f36112f87a7f1d74ecd4887e1467bbae8878a84004a00117b1e475a3e2  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 4e4cbfdc81..7c63633a8d 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2020.12.5
+PYTHON_CERTIFI_VERSION = 2021.5.30
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/6d/78/f8db8d57f520a54f0b8a438319c342c61c22759d8f9a1cd2e2180b5e5ea9
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
