From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 14:24:54 +0100
Subject: [Buildroot] [EXT] Re: [PATCH] boot/mv-ddr-marvell: support
 custom GIT settings
In-Reply-To: <SN2PR18MB0736322D295DB7F9C1D8DA35CAB50@SN2PR18MB0736.namprd18.prod.outlook.com>
References: <20181224131814.20804-1-kostap@marvell.com>
 <20181224185742.GF2703@scaer>
 <SN2PR18MB07361F184E2286FF9C3EB1B0CAB40@SN2PR18MB0736.namprd18.prod.outlook.com>
 <20181226113153.696dc370@windsurf.home>
 <SN2PR18MB0736CDC273B172000ABF67B7CAB50@SN2PR18MB0736.namprd18.prod.outlook.com>
 <20181226112502.GE14286@scaer>
 <SN2PR18MB0736322D295DB7F9C1D8DA35CAB50@SN2PR18MB0736.namprd18.prod.outlook.com>
Message-ID: <20181226142454.59d0bfdf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kostya,

On Wed, 26 Dec 2018 12:33:56 +0000, Kostya Porotchkin wrote:

> [KP] Our intension to add vendor-specific (non-mainlined) components as external packages, which will be based on buildroot build system.
> At some moment they will be public, but will remain vendor-specific and maintained out of the buildroot tree.

I don't think you should make the assumption that those packages will
remain "out of the buildroot tree". As soon as something is publicly
available, there is a chance that someone will be interested in having
it supported as part of upstream Buildroot. So, you shouldn't base your
design on the assumption that this or that package "will remain out of
the Buildroot tree" because this may not be true in the future.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
