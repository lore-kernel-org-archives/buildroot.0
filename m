From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:30:02 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] azure-iot-sdk-c: use
 github for homepage
Message-ID: <20171126184640.99DD5802DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fee92f4f9e0cd662430e3687911baa7e61891650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Many Buildroot users can not read Dutch. Although there is an English
version of this page, the github page looks more suitable as a link for
the software package itself, and the readme.md file is pretty
informative.

Cc: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 5a001b3e6ca8ccdaa7d801afb55cf31f6881433e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
index 366dc91..c554d2f 100644
--- a/package/azure-iot-sdk-c/Config.in
+++ b/package/azure-iot-sdk-c/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_AZURE_IOT_SDK_C
 	  Microsoft Azure IoT Hub device SDK for C is used
 	  to connect devices running C code to Azure IoT Hub.
 
-	  https://docs.microsoft.com/nl-nl/azure/iot-hub/iot-hub-device-sdk-c-intro
+	  https://github.com/Azure/azure-iot-sdk-c
 
 comment "azure-iot-sdk-c needs a toolchain w/ C++ and NPTL"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
