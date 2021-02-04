From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu,  4 Feb 2021 15:22:25 +0100
Subject: [Buildroot] [PATCH] package/python-bluezero: bump to version 0.5.0
Message-ID: <20210204142227.397413-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index d21fefe6e4..d0df83c4c6 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  342718365dbb0df9aa1fb7ea5e405320  bluezero-0.4.0.tar.gz
-sha256  38bc608d26b4381ac3bb2a1d1cf039f1a9891f933b45cf296dbd606557332fad  bluezero-0.4.0.tar.gz
+md5  4004c165f762029c2139f31c269a7531  bluezero-0.5.0.tar.gz
+sha256  d9562a2d107abc918ffdabd4646039c15c54ca1fca0cec91aa45ba6135d2d0b1  bluezero-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index cce45b6bdc..27e11efc14 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.4.0
+PYTHON_BLUEZERO_VERSION = 0.5.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/14/ee/ac038391cf41838ff724e8a11d939e86329043724a7cfd03152f13688bd7
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/90/63/67c56cebe6f741b190f047531810911cfb528e9c0ec6db8d4c911808ba32
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
-- 
2.27.0
