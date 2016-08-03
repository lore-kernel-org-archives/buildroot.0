From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:08:19 +0200
Subject: [Buildroot] [PATCH 4/5] imx-parser: add missing configure
	options
In-Reply-To: <1469627614-29709-5-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 27 Jul 2016 15:53:33 +0200")
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
 <1469627614-29709-5-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <8760rhipjg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Enable hard float support when the configuration contains:
 > BR2_ARM_EABIHF=y

 > See Yocto equivalent:
 > https://github.com/Freescale/meta-fsl-arm/blob/krogoth/recipes-multimedia/imx-parser/imx-parser.inc

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---

 > Thanks to those options:
 > - libraries are copied from release/lib/yocto/hw instead
 >   of release/lib/yocto/sw.

Committed, thanks.

-- 
Bye, Peter Korsgaard
