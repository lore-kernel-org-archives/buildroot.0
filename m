From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon, 18 Feb 2019 21:48:01 +0100
Subject: [Buildroot] [PATCH/next v3 0/6] Adding support for i.MX8QXP MEK
 board
Message-ID: <20190218204807.16815-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Changes since v2:
 - Rebase to next
 - Fix FROM, as this was done at work

Changes since v1:

 - Depend on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X instead of BR2_aarch64
 - Make use of rel_imx_4.14.78_1.0.0_ga instead of the beta version
 - Adjustment to the subjects
