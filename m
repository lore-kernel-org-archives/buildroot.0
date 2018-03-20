From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Mar 2018 16:08:47 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <c5bfa3f1-3d33-bfac-5cf3-3de3204bb878@ozlabs.org>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf>
 <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
 <20180214090148.5b21f55e@windsurf.lan>
 <87lgftau6p.fsf@linkitivity.dja.id.au>
 <20180216154959.4db712f5@windsurf.lan>
 <874llocfch.fsf@dell.be.48ers.dk>
 <20180312015055.3dc9789c@canb.auug.org.au>
 <7a371f6c-1705-dcf6-2ff5-dc5ba46b7114@ozlabs.org>
 <c5bfa3f1-3d33-bfac-5cf3-3de3204bb878@ozlabs.org>
Message-ID: <20180320160847.2ef26965@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeremy,

On Tue, 20 Mar 2018 20:19:01 +0800, Jeremy Kerr wrote:

> Good news: with the logging we had in place recently (and a fix to
> correct error reporting), it looks like we've found the problem with
> parsing emails from a series. This issue was recently addressed by
> Daniel, so I've updated patchwork.ozlabs.org to run the current
> stable/2.0 branch, which has fixes for these. Hopefully this resolves
> the issue with dropped patches.
> 
> The update should also make the mail parser a little more robust against
> transient failures too.
> 
> Let me know how things go over the next few days.
> 
> Thomas and Dave: please keep using the custom addresses you've
> configured for the incoming mail feed; this will allow me to keep an eye
> on things on my side too. Assuming everything goes fine, we can revert
> to the usual address next week.

Thanks a lot for this debugging effort! We'll monitor how patchwork
behaves in the next days and give you some feedback (good or bad).

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
