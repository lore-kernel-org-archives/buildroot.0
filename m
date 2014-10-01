From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 18:23:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-09-30
In-Reply-To: <20141001075116.7913ff52@core2quad.morethan.org>
References: <20141001063012.7DD7A100CC7@stock.ovh.net>
 <20141001075116.7913ff52@core2quad.morethan.org>
Message-ID: <20141001182322.53f6fd68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Oct 2014 07:51:16 -0500, Mike Zick wrote:

> > Build statistics for 2014-09-30
> > ===============================
> > 
> >         success : 121
> >        failures : 15 
> >        timeouts : 2  
> >           TOTAL : 138
> > 
> 
> Looking good for so early in the cycle.

Yes, even though 138 is a bit limited in terms of build numbers for one
day. I believe there were some issues with the Buildroot Git server
lately, maybe this has slowed down the autobuilders a bit. We used to
have in the order of 200-220 builds per day. Hum, looking more, seems
like all the autobuilders from Peter are no longer submitting build
results.

Peter?

> Now the noise:
> 
> I have noticed that recently some of the fix contributors
> have been including a "few line" quote of a typical error
> message in addition to the "fix(es): url" comment.
> 
> As a read-mostly member, I find that new (habit? practice?)
> very helpful when reading the daily M.L. fix messages.
> 
> Q:
> Should there be a discussion on making this additional
> information a BR "recommended practice" ?

I personally don't have a strong opinion. Since the autobuilder URLs
are stable, and supposed to be kept around forever, I don't mind seeing
only the autobuilder URL. But if the submitter decides to include a
portion of the error message, then fine as well. We could imagine that
doing this would give a better change of people googling for the error
message, to stumble across the relevant Buildroot patch rather than
just the autobuilder results.

Not sure I want to make this a mandatory thing, though. We already have
a lot of requirements, and doing autobuilder fixes is already not that
fun, so if we raise the barrier too much, this might discourage
contributors.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
