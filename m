From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Jul 2018 15:08:25 +0200
Subject: [Buildroot] [PATCH 1/8] firmware-imx: bump to version 7.5
In-Reply-To: <6f639664-4b81-033c-fa68-44d48e0a347f@mind.be>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <20180725150149.30774-2-gary.bisson@boundarydevices.com>
 <6f639664-4b81-033c-fa68-44d48e0a347f@mind.be>
Message-ID: <20180729150825.76f085c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jul 2018 23:53:44 +0200, Arnout Vandecappelle wrote:
> On 25-07-18 17:01, Gary Bisson wrote:
> > This new package includes new binaries for i.MX8QXP.
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>  
> 
>  I've applied this patch to master, the rest is changes requested.

I don't know if we have been clear enough with Gary about what changes
we want. Do we want to stay with a virtual package ? If so, what should
be the name of the virtual package vs. the name of the package for the
"old" i.MX VPUs ?

On my side, while I agree that imx-vpu-cnm violates the rule of "we
name packages like their upstream name", I believe this is a violation
that is acceptable because the naming chosen by Gary is the one that is
the easiest to understand and the most obvious: imx-vpu is the virtual
package, imx-vpu-hantro and imx-vpu-cnm are the providers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
