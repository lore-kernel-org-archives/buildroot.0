From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:17:30 +0100
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: bump version to
 LTS_07_2020_Ref02
Message-ID: <20201223120720.EB35B80462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9699996da1e1b32224488a084c9c8acc80ff69c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 8e547963e2..1151dcc9ed 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6f5ce8a81ed941e525a0265844082e4c641e9ac5cdac8b00bc92492700512a43  azure-iot-sdk-c-LTS_07_2020_Ref01.tar.gz
+sha256  1139a469c0c097ef3b6ecfca4527ee5c8ff1cfcb16b5bd1739129c528cd53416  azure-iot-sdk-c-LTS_07_2020_Ref02.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 19f0812f84..c664ad83a4 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_07_2020_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_07_2020_Ref02
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
