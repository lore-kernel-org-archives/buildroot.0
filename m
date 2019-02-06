From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 22:22:05 +0100
Subject: [Buildroot] [git commit] package/openocd: fix indentation of
 Config.in help text
Message-ID: <20190207080709.40EB3812DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=621ccce86c71d136a56c127d0c6549dec4e3f4a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warnings:

package/openocd/Config.in:20: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/openocd/Config.in:21: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openocd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index d8af37b7f9..abba07e889 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -17,8 +17,8 @@ config BR2_PACKAGE_OPENOCD_CMSIS_DAP
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_HIDAPI
 	help
-          Enable support for CMSIS-DAP compliant debuggers (i.e
-          Atmel/Microchip EDBG, etc.)
+	  Enable support for CMSIS-DAP compliant debuggers (i.e
+	  Atmel/Microchip EDBG, etc.)
 
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
