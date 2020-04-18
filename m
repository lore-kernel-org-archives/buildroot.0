From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 20:15:56 -0700
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump version to 1.26
Message-ID: <20200418031556.1711155-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/pkcs11-helper/pkcs11-helper.hash | 2 +-
 package/pkcs11-helper/pkcs11-helper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index c0411a2f45..276ed2e221 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  fbcec9dd15a71d6ef22b09f63934c66d7d0292fefbaf3a60703ee4a9a73bf6a5  pkcs11-helper-1.25.1.tar.gz
+sha256  e5e2eefeda6c3db3d8862b42b180a6a5b2f41285f35b0ad0d622c6767683fd84  pkcs11-helper-1.26.tar.gz
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index a86cabd65a..24e0c65d84 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.25.1
+PKCS11_HELPER_VERSION = 1.26
 PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,pkcs11-helper-$(PKCS11_HELPER_VERSION))
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
-- 
2.25.2
