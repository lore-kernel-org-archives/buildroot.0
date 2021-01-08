From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2021 08:44:40 +0100
Subject: [Buildroot] [PATCH 1/1]
 package/freescale-imx/firmware-imx/Config.in: install imx6q binaries for
 IM6UL platform
In-Reply-To: <20201113101026.1824-1-pawnrob@gmail.com> (pawnrob's message of
 "Fri, 13 Nov 2020 10:10:26 +0000")
References: <20201113101026.1824-1-pawnrob@gmail.com>
Message-ID: <87mtxjyis7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "pawnrob" == pawnrob  <pawnrob@gmail.com> writes:

 > From: RMellor <Rob.Mellor@ultra-pals.com>
 > linux-*/arch/arm/boot/dts/imx6ul.dtsi
 > requires the install of the sdma-imx6q.bin as stated in
 > line 727: fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";

 > without the BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME being set to "imx6q"
 > line 102 of firmware-imx.mk does not install the firmware to to target

 > Signed-off-by: RMellor <Rob.Mellor@ultra-pals.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
