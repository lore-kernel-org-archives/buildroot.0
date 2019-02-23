From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 15:28:12 +0100
Subject: [Buildroot] [git commit] package/freescale-imx: add option for
 i.MX8X
Message-ID: <20190305095736.821928E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3568d58f8eac983572bccf39b7a4d3e0e4e1f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <andre.hentschel@zf.com>
[Thomas: split up from the firmware-imx patch]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 95c0aab08c..9001764437 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -42,6 +42,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	bool "imx8x"
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
