From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 06:54:13 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <497CFB4F.2010402@iwtech.com.au> (Paul Jones's message of "Mon\,
	26 Jan 2009 10\:52\:47 +1100")
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
	<1232868757.5311.170.camel@elrond.atmel.com>
	<87zlhffs9j.fsf@macbook.be.48ers.dk>
	<1232918236.2298.9.camel@elrond.atmel.com>
	<8763k3dqi3.fsf@macbook.be.48ers.dk>
	<1232922252.2298.34.camel@elrond.atmel.com>
	<497CFB4F.2010402@iwtech.com.au>
Message-ID: <87wscid33u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Jones <paul.jones@iwtech.com.au> writes:

 Paul> Ulf Samuelsson wrote:
 >> 
 >> Now it works, regardless if you have X or not.
 >> so we and the user do not have to choose.
 >> 
 >> If X is available you have a better experience.

 Paul> I should just point out that my build system is a Gentoo64
 Paul> server via SSH, my desktop is usually Windows. I'd much prefer
 Paul> to use X myself but don't relay have a choice.

Exactly. We've heard from other people using a similar setup.

Menuconfig obviously works as we use it in buildroot, so that's the
safe choice for kernel config as well.

 Paul> As a newbie here I tend to need as much help as I can get! When
 Paul> the build crashed and complained about QT missing I thought I'd
 Paul> accidentally added some X package into buildroot, it was only
 Paul> after a few hours of doing step by step builds that I figured
 Paul> out it must have been running xconfig rather than
 Paul> menuconfig. Once I disabled the kernel it compiled first go,
 Paul> which is still a lot further than I got when I first tried
 Paul> buildroot a few months ago!

 Paul> Keep up the good work guys!

Thanks.

-- 
Bye, Peter Korsgaard
