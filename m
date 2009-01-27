From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 10:25:26 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
In-Reply-To: <1233008389.2298.129.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 23\:19\:49 +0100")
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk>
	<1233005366.2298.118.camel@elrond.atmel.com>
	<871vup4ul9.fsf@macbook.be.48ers.dk>
	<1233008389.2298.129.camel@elrond.atmel.com>
Message-ID: <87vds114op.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi.

 Ulf> No, Just because you like to run with the latest kernel,
 Ulf> that view is not shared by everyone else.
 >> 
 >> Ok, so what patches can be removed? I take it that atleast *SOME* of
 >> those 10 versions can go?

 Ulf> I have customers still working on 2.6.22 ...

Working as in doing active development? Really?

 Ulf> I think you need to understand that some people
 Ulf> are planning for 10-15 year lifetime of products.
 Ulf> They do not neccessarily update the kernel very often.
 Ulf> If they do, they are likely to juyst add tweaks to
 Ulf> their kernel instead of upgrading to a new version.

I work at a company developing display technology for the military
market, so you don't need to tell me about long term support ;)

But the problem is that you are mixing up configuration control of a
project, and development of buildroot. When you do a project you
ofcourse need to get your individual components under configuration
and be able to reproduce your build if you ever need to fix
something. This ALSO includes buildroot version.

Completely next to that is the state of buildroot svn. This has to be
suitable for starting new projects off, so it needs recent versions of
packages with the latest bugfixes included.

For starting a new project, selecting anything else than the 2.6.28
(or even better, the latest 2.6.29-rcX) seems pretty silly to me, but
I'm even stretching it to include 2.6.27 just in case.

So again, what kernel versions in arch-arm can we remove from svn?

 Ulf> If you implement the patch downloading, there is
 Ulf> very little reason to remove functionality.

Ofcourse there is, otherwise the number of configuration combinations
to test would grow astronomically.

-- 
Bye, Peter Korsgaard
