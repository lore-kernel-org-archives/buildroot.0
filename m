From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:38:48 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48721B90.5070905@atmel.com> (Ulf Samuelsson's message of "Mon\,
	07 Jul 2008 15\:35\:12 +0200")
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc> <4872169E.2010102@atmel.com>
	<20080707132334.GD15840@mx.loc> <48721B90.5070905@atmel.com>
Message-ID: <87mykt4v47.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Maybe it should be possible then in buildroot to
 Ulf> select where target Gnome is installed?

That would be silly. The standard location for stuff is /usr, and we
don't provide settings for all our other packages.

-- 
Bye, Peter Korsgaard
