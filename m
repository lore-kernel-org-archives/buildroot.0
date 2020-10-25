From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Oct 2020 07:06:09 -0300
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump version to
 LTS_07_2020_Ref01
Message-ID: <20201025100609.29669-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index e9c3cf427965..8e547963e27d 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  36f41f4f59eb0b4a61e7d64ba8fabb4bcc66ab21473688273cd45c2a7b65bb49  azure-iot-sdk-c-LTS_02_2020_Ref01.tar.gz
+sha256  6f5ce8a81ed941e525a0265844082e4c641e9ac5cdac8b00bc92492700512a43  azure-iot-sdk-c-LTS_07_2020_Ref01.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index caca857591de..19f0812f8422 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_02_2020_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_07_2020_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.17.1
