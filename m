From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:59:48 +0200
Subject: [Buildroot] [PATCH 2/5] imx-codec: add missing configure options
In-Reply-To: <1469627614-29709-3-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 27 Jul 2016 15:53:31 +0200")
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
 <1469627614-29709-3-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87eg65ipxn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Enable VPU and hard float support when the configuration contains:
 > BR2_ARM_EABIHF=y
 > BR2_PACKAGE_IMX_VPU=y

 > See Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-codec/imx-codec.inc

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
