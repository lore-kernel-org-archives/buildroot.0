From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 8 Jul 2008 17:12:24 +1000
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87prppue6v.fsf@macbook.be.48ers.dk>
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc> <4872169E.2010102@atmel.com>
	<20080707132334.GD15840@mx.loc> <48721B90.5070905@atmel.com>
	<87mykt4v47.fsf@macbook.be.48ers.dk>
	<AAFCB58EA8634B0CADEDE37957685CEC@aeglos>
	<877ibxzfh4.fsf@macbook.be.48ers.dk> <48729A8C.4070303@atmel.com>
	<87prppue6v.fsf@macbook.be.48ers.dk>
Message-ID: <20080708071224.GA23887@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 08, 2008 at 07:39:52AM +0200, Peter Korsgaard wrote:
>  Ulf> Did not check.
> 
> I think they only support distributions with gnome in /usr.

Why do we need to determine the full path anyway rather than using
$(PATH)? Or always build our own glib-genmarshal rather than trying to
determine if there's a host one available, or just require that a host
one is installed in the path.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
