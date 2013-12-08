From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Dec 2013 14:15:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-07
In-Reply-To: <CAHt8ZCO_+TUHTwU6x7jgOh-S91=w0gG9NsJgo80keR4Yb+kV8Q@mail.gmail.com>
References: <20131208073009.673C5101507@stock.ovh.net>
 <CAHt8ZCNu8Nwzh1LfD00CQ3CTMsS8NQ51GmdM+9QiRfzg-s_ShQ@mail.gmail.com>
 <87haajborq.fsf@dell.be.48ers.dk> <20131208120858.1d8636b4@skate>
 <CAHt8ZCO_+TUHTwU6x7jgOh-S91=w0gG9NsJgo80keR4Yb+kV8Q@mail.gmail.com>
Message-ID: <20131208141551.38206698@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Sun, 8 Dec 2013 12:01:25 +0000, Simon Dawson wrote:

> There are two options, as far as I can see:
> # Revert the 3.9 -> 3.10 gpsd version bump
> # Backport some gpsd patches (currently there are three of these), and
> probably bump the Git snapshot ID
> Personally, I'd prefer the second option, as any outstanding autobuild
> failures will be useful to me in continuing to push fixes upstream
> before the impending 3.11 release.
> 
> What's your preference?

I'm personally fine with either, but I do understand that the second
option is better to prepare the future :)

So if Peter doesn't mind, doing the second option would be good. But
maybe you should wait for Peter's opinion on this, before doing some
work that may not match Peter's choice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
