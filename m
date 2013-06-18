From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jun 2013 19:15:08 +0200
Subject: [Buildroot] Randomization of kconfig choices?
In-Reply-To: <20130618190009.7a08518a@skate>
References: <20130618093107.6c08e477@skate> <20130618164904.GB3952@free.fr>
 <20130618190009.7a08518a@skate>
Message-ID: <20130618171508.GC3952@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-18 19:00 +0200, Thomas Petazzoni spake thusly:
> On Tue, 18 Jun 2013 18:49:04 +0200, Yann E. MORIN wrote:
> > No, I could not come up with a satisfiable solution so far. I've put it
> > a bit in a limbo, so I can start afresh from a new angle.
> > 
> > There have been some fixes in this area recently, but alas, none fixes
> > the randomisation of choices in presence of KCONFIG_ALLCONFIG.
> > 
> > But I was planning to work on this this week. Let's see where that will
> > get us...
> 
> Aren't there some people that know better the history of this kconfig
> that would be able to help?

It seems no one knowledgeable is willing to invest time in this.

There was someone (Sam?) who said he'd look, but that was over a month
ago, and he did not reply to my last mail. :-/

I have a small idea at the back of my mind that I have to put to
testing. I /may/ put you to contribution later tonight, mind you! ;-)

> It seems like you're now more-or-less the
> only one patching this stuff.

Oh, no. There have been a few new-comers lately who did provide some
further (good) fixes to things we were not even aware of.

I was even recently directed to a collection of kconfig patches from a
completely unrelated project (but somehow similar in spirit to what
Buildroot is, only to a much smaller scale).

There are good things there, and we're trying to shape them before
submitting (that won't be in 3.10, and probably not even in 3.11 since
it will probably not be ready before the next merge window, I'm afraid).

But, yes, no one is as interested as I am to get those being acutally
_merged_ upstream, it seems... :-/

But anyway, enough talk; let's do some coding! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
