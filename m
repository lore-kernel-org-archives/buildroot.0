From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 21:00:55 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <AAFCB58EA8634B0CADEDE37957685CEC@aeglos> (Ulf Samuelsson's
	message of "Mon\, 7 Jul 2008 19\:28\:50 +0200")
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc> <4872169E.2010102@atmel.com>
	<20080707132334.GD15840@mx.loc> <48721B90.5070905@atmel.com>
	<87mykt4v47.fsf@macbook.be.48ers.dk>
	<AAFCB58EA8634B0CADEDE37957685CEC@aeglos>
Message-ID: <877ibxzfh4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> That would be silly. The standard location for stuff is /usr, and we
 >> don't provide settings for all our other packages.
 >> 

 Ulf> So you think that the situation we have now, when libgtk2 will
 Ulf> not compile when gnome is installed in "/opt/gnome2 on the host  is a
 Ulf> good one?

No, not particular good, but better than the other way around as /usr
is standard, /opt/gnome2 isn't.

How does openembedded handle it?

-- 
Bye, Peter Korsgaard
