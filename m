From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  2 Nov 2017 15:17:56 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: use github for homepage
Message-ID: <d319638c428df5d8c66bec892d079b04a8d47c45.1509628676.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many Buildroot users can not read Dutch. Although there is an English
version of this page, the github page looks more suitable as a link for
the software package itself, and the readme.md file is pretty
informative.

Cc: Andr? Hentschel <nerv@dawncrow.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/azure-iot-sdk-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
index 366dc91ea6ea..c554d2fb9b44 100644
--- a/package/azure-iot-sdk-c/Config.in
+++ b/package/azure-iot-sdk-c/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 	  Microsoft Azure IoT Hub device SDK for C is used
 	  to connect devices running C code to Azure IoT Hub.
 
-	  https://docs.microsoft.com/nl-nl/azure/iot-hub/iot-hub-device-sdk-c-intro
+	  https://github.com/Azure/azure-iot-sdk-c
 
 comment "azure-iot-sdk-c needs a toolchain w/ C++ and NPTL"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.14.2
