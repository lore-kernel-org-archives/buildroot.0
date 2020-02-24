From: Jerry Huang <jerry.huang@nxp.com>
Date: Mon, 24 Feb 2020 14:44:03 +0000
Subject: [Buildroot] [EXT] Re: [v5,
 4/9] package/qoriq-rcw: add target rcw binary support
In-Reply-To: <DM6PR01MB5849DB1F91ABFC7663CCDACCF3120@DM6PR01MB5849.prod.exchangelabs.com>
References: <DM6PR01MB5849DB1F91ABFC7663CCDACCF3120@DM6PR01MB5849.prod.exchangelabs.com>
Message-ID: <VI1PR04MB513623F6B6C06A9C9BFA1D01FEEC0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, 

Best Regards
Jerry Huang

> -----Original Message-----
> From: Gervais, Francois <FGervais@distech-controls.com>
> Sent: Saturday, February 22, 2020 6:00 AM
> To: buildroot at buildroot.org
> Cc: Jerry Huang <jerry.huang@nxp.com>
> Subject: [EXT] Re: [v5,4/9] package/qoriq-rcw: add target rcw binary support
> 
> Caution: EXT Email
> 
> Hi Jerry,
> 
> I'm not sure if "Custom RCW" is the right menu name for
> BR2_PACKAGE_HOST_QORIQ_RCW_BIN.
The menu name may be changed to others, like this "RCW binary name"

> To me, BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH is the custom rcw as
> it is provided by the user.
> 
> I feel BR2_PACKAGE_HOST_QORIQ_RCW_BIN is the opposite of custom actually
> as it builds a manufacturer provided RCW file.
BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH: used for customer
BR2_PACKAGE_HOST_QORIQ_RCW_BIN: used for NXP qoriq platforms

> What do you think?
> 
> Also should it really depends on
> "!BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH"?
> What prevents a user from building 2 RCWs for some reason, 1 user provided
> and 1 officially provided through qoriq-rcw-LSDK-19.09.tar.gz?
I think for one board, just 1 RCW binary is needed.
If customer need two RCW binary as you said, I think customer should be have two different defconfig.
