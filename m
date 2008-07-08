From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 12:25:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48733A9D.8090302@atmel.com> (Ulf Samuelsson's message of "Tue\,
	08 Jul 2008 11\:59\:57 +0200")
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc> <4872169E.2010102@atmel.com>
	<20080707132334.GD15840@mx.loc> <48721B90.5070905@atmel.com>
	<87mykt4v47.fsf@macbook.be.48ers.dk>
	<AAFCB58EA8634B0CADEDE37957685CEC@aeglos>
	<877ibxzfh4.fsf@macbook.be.48ers.dk> <48729A8C.4070303@atmel.com>
	<87prppue6v.fsf@macbook.be.48ers.dk>
	<20080708071224.GA23887@cloud.net.au> <48733A9D.8090302@atmel.com>
Message-ID: <87mykspt9t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Hamish Moffatt skrev:
 >> On Tue, Jul 08, 2008 at 07:39:52AM +0200, Peter Korsgaard wrote:
 Ulf> Did not check.
 >>> 
 >>> I think they only support distributions with gnome in /usr.
 >> 
 >> Why do we need to determine the full path anyway rather than using
 >> $(PATH)? Or always build our own glib-genmarshal rather than trying to
 >> determine if there's a host one available, or just require that a host
 >> one is installed in the path.
 >> 
 >> Hamish

 Ulf> The gnome configuration does not use $(PATH) to determine
 Ulf> where glib-genmarshal is located.
 Ulf> It also ignores totally the GLIB_GENMARSHAL environment variable.

So is sounds like the proper solution is to patch that part of the
buildsystem instead.

-- 
Bye, Peter Korsgaard
