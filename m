From: Jerry Huang <jerry.huang@nxp.com>
Date: Mon, 24 Feb 2020 14:44:05 +0000
Subject: [Buildroot] [EXT] Re: [v5,
 3/9] package/qoriq-rcw: bump to version LSDK-19.09
In-Reply-To: <DM6PR01MB58498E8B6D7E4DFB76C2F121F3120@DM6PR01MB5849.prod.exchangelabs.com>
References: <DM6PR01MB58498E8B6D7E4DFB76C2F121F3120@DM6PR01MB5849.prod.exchangelabs.com>
Message-ID: <VI1PR04MB5136F11FD4D66183033821DFFEEC0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Gervais, Francois <FGervais@distech-controls.com>
> Sent: Saturday, February 22, 2020 6:10 AM
> To: buildroot at buildroot.org
> Cc: Jerry Huang <jerry.huang@nxp.com>
> Subject: [EXT] Re: [v5,3/9] package/qoriq-rcw: bump to version LSDK-19.09
> 
> Caution: EXT Email
> 
> Hi Jerry,
> 
> I think this patch breaks:
> 
> define HOST_QORIQ_RCW_BUILD_CMDS
>         python $(@D)/rcw.py -i
> $(@D)/custom_board/rcw/$(QORIQ_RCW_PROJECT) -I $(@D)/custom_board -o
> $(@D)/PBL.bin endef
> 
> host-qoriq-rcw-LSDK-19.09/rcw.py fails with:
> 
> "Only Python versions 3.0+ are supported."
Python3 is the future ?.
