From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 19:11:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-06
In-Reply-To: <5460DEAB.6000303@imgtec.com>
References: <20141107073016.0C55F1018AC@stock.ovh.net>
 <545C9CAE.3070303@imgtec.com>
 <20141108184741.66cf1357@free-electrons.com>
 <5460DEAB.6000303@imgtec.com>
Message-ID: <20141110191131.26eae84c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 10 Nov 2014 15:50:03 +0000, Vicente Olivert Riera wrote:

> > You should simply ignore such results.
> 
> Do you think it would be a good idea to check the status before sending
> the report to the mailing list? Something like this:
> 
> if status == TIM
>   send_report_to_autobuilder_owner()
> else
>   send_report_to_mailing_list()
> endif

Patches welcome :-)

More seriously, I think our time would be better spent on finding ways
to simply avoid getting those false results.

> > If this is a race condition, we could switch to using $(MAKE1) for this
> > package until the issue gets resolved upstream.
> 
> Good idea. Unfortunately nobody confirmed that upstream, and this
> failure is very hard to reproduce. I have tried it lots of times without
> success. In fact, there are no more autobuild failures...
> 
> I think we can just wait until upstream fixes the problem since nobody
> else (autobuilders included) reported this problem again :P

Then let's wait to see if the autobuilders see it again. If it happens
again, then we'll try harder to fix the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
