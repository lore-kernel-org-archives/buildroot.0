From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Tue, 25 Nov 2014 19:34:20 +0100
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <20141125183017.31cb5e67@free-electrons.com>
References: <20141019163952.19c7c080@free-electrons.com>	<1416931943-3504-1-git-send-email-vincent.stehle@freescale.com>	<20141125175420.7b6ff884@e6520eb.localdomain>	<5474B65D.5010401@freescale.com>
 <20141125183017.31cb5e67@free-electrons.com>
Message-ID: <5474CBAC.8020508@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/25/2014 06:30 PM, Thomas Petazzoni wrote:
(re-submit a v3)
> I'd say yes.

Ok, will do.

> Is 2.6.35 the latest kernel available for this platform,
> or could we switch to a more recent version.

The kernel b3912bb used in buildroot for mx53loco is more advanced than
the latest official release 2.6.35 11.09 from Freescale on the Quick
Start Board [1]. Nothing to update there I would say.

Best regards,

V.

[1]
http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=IMX53QSB&fpsp=1&tab=Design_Tools_Tab
