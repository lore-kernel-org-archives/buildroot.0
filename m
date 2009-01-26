From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 17:23:33 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <1232922252.2298.34.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 25 Jan 2009 23\:24\:12 +0100")
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
	<1232868757.5311.170.camel@elrond.atmel.com>
	<87zlhffs9j.fsf@macbook.be.48ers.dk>
	<1232918236.2298.9.camel@elrond.atmel.com>
	<8763k3dqi3.fsf@macbook.be.48ers.dk>
	<1232922252.2298.34.camel@elrond.atmel.com>
Message-ID: <87bptu6np6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Now it works, regardless if you have X or not.
 Ulf> so we and the user do not have to choose.

 Ulf> If X is available you have a better experience.

We've mentioned several times that xconfig isn't necessarily a better
experience (E.G. it's inconsistent with BR and the busybox/uclibc
-menuconfig targets, unusable on slow links and pops up in another
window, effectively blocking the build without output until the user
figures that out, ..)

The default needs to be menuconfig like it was before.

 >> But why? Just use menuconfig and be done with it. What does xconfig
 >> bring you that menuconfig doesn't?

 Ulf> Ease of use - ?menuconfig is archaic
 Ulf> I would prefer to use Xconfig for Buildroot as well.

With that mindset you probably think the entire concept of BR is
arhaic ;)

 Ulf> You want to minimize the options for the user, so I suggest
 Ulf> that you write a new way of configuring Linux
 Ulf> so you can do it the way You want.
 >> 
 >> Sigh. Ulf, you really need to learn to work with the rest of the BR
 >> developers.

 Ulf> If people have valid issues, then I listen,
 Ulf> My main problem is that not only does people want to 
 Ulf> to it in a certain way, they also want to ensure
 Ulf> that it is not possible to do it in another way.

Ulf, I think you need to read
http://udrepper.livejournal.com/7326.html and then think about the
costs involved with adding configuration options (for the developers
AND for the users).

 Ulf> If you want to ensure that Buildroot does not crash
 Ulf> when people select to use make *-config, then that is 
 Ulf> a valid concern.

 Ulf> If you want to ensure that Buildroot users 
 Ulf> are coreced into using menuconfig, then I think it is not.

s/menuconfig/xconfig/.

 Ulf> If you want to ensure that people has to spend tons of time, 
 Ulf> updating the config file to fit their desires
 Ulf> every time they download the trunk, again, I am against that.

 Ulf> IMO, the submitted solution should meet all valid concerns.

with default = menuconfig it does, so that's what I'll change it to.

-- 
Bye, Peter Korsgaard
