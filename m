From: Michael Walle <michael@walle.cc>
Date: Tue, 26 Nov 2019 10:21:56 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <VI1PR04MB513679F2B82773C7958DBA07FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-8-jerry.huang@nxp.com>
 <20191125231221.743cd7ed@windsurf>
 <VI1PR04MB513679F2B82773C7958DBA07FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <551b5d3c9eb0c435110d1e0fbe634419@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2019-11-26 09:09, schrieb Jerry Huang:
> Best Regards
> Jerry Huang
> 
>> -----Original Message-----
>> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> Sent: Tuesday, November 26, 2019 6:12 AM
>> To: Jerry Huang <jerry.huang@nxp.com>
>> Cc: buildroot at busybox.net; michael at walle.cc; 
>> matthew.weber at collins.com;
>> geomatsi at gmail.com
>> Subject: [EXT] Re: [Buildroot] [PATCH v2 07/10]
>> package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
>> 
>> Caution: EXT Email
>> 
>> Hello,
>> 
>> On Thu, 21 Nov 2019 18:23:21 +0800
>> Changming Huang <jerry.huang@nxp.com> wrote:
>> 
>> > From: Jerry Huang <jerry.huang@nxp.com>
>> >
>> > This package provides the firmware for LS1028ARDB DP (display port).
>> >
>> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
>> 
>> Overall, looks pretty good. Rename to nxp-qoriq-... if you decide to 
>> use the nxp
>> branding.
> Sure, I will rename it.
> 
>> > diff --git a/DEVELOPERS b/DEVELOPERS
>> > index 9fbe229eb7..b15115f507 100644
>> > --- a/DEVELOPERS
>> > +++ b/DEVELOPERS
>> > @@ -2545,3 +2545,6 @@ F:      package/qjson/
>> >  F:   package/quazip/
>> >  F:   package/shapelib/
>> >  F:   package/tinc/
>> > +
>> > +N:   Changming Huang <jerry.huang@nxp.com>
>> 
>> Please sort your name at the right place in the DEVELOPERS file 
>> (alphabetic
>> ordering).
> sure
> 
>> > diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
>> > b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
>> > new file mode 100644
>> > index 0000000000..9259776750
>> > --- /dev/null
>> > +++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
>> > @@ -0,0 +1,5 @@
>> > +config BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW
>> > +     bool "FSL QorIQ cadence DP firmware"
>> 
>> Just:
>> 
>>         bool "fsl-qorirq-cadence-dp-fw
> Sure,

Sorry about being so pedantic about this.. but like I said before, 
almost all (there is one exception, "murata-cyw-fw") firmware packages 
have a -firmware suffix.

-michael
