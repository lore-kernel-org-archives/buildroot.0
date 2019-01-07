From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Mon,  7 Jan 2019 19:14:32 +0100
Subject: [Buildroot] [PATCH v2 0/6] Adding support for i.MX8QXP MEK board
Message-ID: <20190107181438.23857-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

As promised v2 after testing it on real HW.

Changes since v1:

 - Depend on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X instead of BR2_aarch64
 - Make use of rel_imx_4.14.78_1.0.0_ga instead of the beta version
 - Adjustment to the subjects
