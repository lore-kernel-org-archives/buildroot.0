From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:21:21 +0100
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2020.12.5
Message-ID: <20201213091419.35B3383E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09daae66d113c9baab3bb9a243820c0b86aa3542
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 8543393d83..7605672514 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  89525ece725d674d91b0c43007d2a47e  certifi-2020.6.20.tar.gz
-sha256  5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3  certifi-2020.6.20.tar.gz
+md5  522f9abe26e5d603a668d812aa6accca  certifi-2020.12.5.tar.gz
+sha256  1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c  certifi-2020.12.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index faa0a0a89f..4e4cbfdc81 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2020.6.20
+PYTHON_CERTIFI_VERSION = 2020.12.5
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/40/a7/ded59fa294b85ca206082306bba75469a38ea1c7d44ea7e1d64f5443d67a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
