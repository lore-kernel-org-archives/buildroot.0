From: Maeva Manuel <maeva.manuel@nxp.com>
Date: Mon, 9 Sep 2019 12:15:02 +0000
Subject: [Buildroot] [PATCH 4/7] package/freescale-imx/imx-sc-firmware: add
 hash file
In-Reply-To: <20190909121525.13935-1-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
Message-ID: <20190909121525.13935-4-maeva.manuel@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
new file mode 100644
index 0000000000..3b4326302f
--- /dev/null
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 d07f8e517e0bd82175d1cd77e01b6702735eb95774053f9c431d1a5016fc7152  imx-sc-firmware-1.1.bin
+sha256 fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
+sha256 78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
-- 
2.17.1
