From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Nov 2010 08:51:21 +0100
Subject: [Buildroot] [git commit master 1/1] target-finalize:
	libtread_db: support nonstd toolchain setups
In-Reply-To: <201011281713.58894.vapier@gentoo.org> (Mike Frysinger's message
	of "Sun, 28 Nov 2010 17:13:57 -0500")
References: <20101128211439.EA7DC8D34B@busybox.osuosl.org>
	<201011281713.58894.vapier@gentoo.org>
Message-ID: <87y68czhxi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 Mike> this is incorrect.  it really has nothing to do with the
 Mike> toolchain, nor is it non standard.  but i guess too late to fix
 Mike> this now.  -mike

Well, toolchain in the wider sense - uClibc setup. And it is nonstandard
in the sense that it isn't what buildroot makes / what uClibc 'make
install_runtime' creates.

And yes, we don't rebase the buildroot repo, so it's too late to change.

-- 
Bye, Peter Korsgaard
