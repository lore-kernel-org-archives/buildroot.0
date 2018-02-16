From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Feb 2018 15:49:59 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <87lgftau6p.fsf@linkitivity.dja.id.au>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf>
 <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
 <20180214090148.5b21f55e@windsurf.lan>
 <87lgftau6p.fsf@linkitivity.dja.id.au>
Message-ID: <20180216154959.4db712f5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Sat, 17 Feb 2018 01:24:46 +1100, Daniel Axtens wrote:

> Andrew mentioned to me that we might have a race condition, and so I had
> a quick poke at loading patches in parallel. Sure enough I was able to
> easily hit an issue at least on the MySQL backend. (OzLabs uses postgres
> but it's still a good data-point as it shows we're not handling this
> sort of thing in code.)
> 
> This is quite possibly related to your issue - I will do some more
> investigation and let you know how we go.

Thanks a lot for the follow-up details on this.

I think it's worth mentioning that it seems to be a relatively "recent"
regression, probably within the last 6 months or so. In the past, we
were clearly not seeing such a problem, and all patches were properly
recorded. The problem is frequent enough that we would have noticed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
