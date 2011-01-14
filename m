From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Jan 2011 22:53:38 +0100
Subject: [Buildroot] [PATCH 3/7] toolchain: add a USE_MMU build option
In-Reply-To: <201101141627.50341.vapier@gentoo.org> (Mike Frysinger's message
	of "Fri, 14 Jan 2011 16:27:49 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-3-git-send-email-vapier@gentoo.org>
	<87y66nvfcd.fsf@macbook.be.48ers.dk>
	<201101141627.50341.vapier@gentoo.org>
Message-ID: <87zkr36tjx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 >> What archs currently have working nommu support in uClibc?

 Mike> any arch can be built as "nommu".  it simply means certain
 Mike> functions are not enabled (like fork) while others are not as
 Mike> complicated (like malloc).  so there is no technical limitation
 Mike> that only certain arches support nommu.  -mike

Naturally, but which one are used in the wild? E.G. what is supported by
linux-2.6.37 and uClibc-0.9.32-rc1 ?

-- 
Bye, Peter Korsgaard
