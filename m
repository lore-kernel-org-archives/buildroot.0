From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 19:19:48 +0200
Subject: [Buildroot] Randomization of kconfig choices?
In-Reply-To: <20130618171508.GC3952@free.fr>
References: <20130618093107.6c08e477@skate> <20130618164904.GB3952@free.fr>
 <20130618190009.7a08518a@skate> <20130618171508.GC3952@free.fr>
Message-ID: <20130618191948.3fee955c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 18 Jun 2013 19:15:08 +0200, Yann E. MORIN wrote:

> > Aren't there some people that know better the history of this kconfig
> > that would be able to help?
> 
> It seems no one knowledgeable is willing to invest time in this.

Yeah, that's unfortunate :-(

> There was someone (Sam?) who said he'd look, but that was over a month
> ago, and he did not reply to my last mail. :-/
> 
> I have a small idea at the back of my mind that I have to put to
> testing.

Great!

> I /may/ put you to contribution later tonight, mind you! ;-)

I will most likely not be available later tonight, but tomorrow I can
do some testing of whatever you came up with!

> > It seems like you're now more-or-less the
> > only one patching this stuff.
> 
> Oh, no. There have been a few new-comers lately who did provide some
> further (good) fixes to things we were not even aware of.

Being on the linux-kbuild list, I've seen those contributions, but many
of them are mostly on the surface, not hacking the low levels of the
kconfig magic.

> I was even recently directed to a collection of kconfig patches from a
> completely unrelated project (but somehow similar in spirit to what
> Buildroot is, only to a much smaller scale).

Interesting.

> There are good things there, and we're trying to shape them before
> submitting (that won't be in 3.10, and probably not even in 3.11 since
> it will probably not be ready before the next merge window, I'm afraid).

Yeah, 3.11 is approaching!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
