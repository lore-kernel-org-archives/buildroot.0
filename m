From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 09:05:17 +0200
Subject: [Buildroot] [buildroot 0003764]: elf2flt doesn't support powerpc
In-Reply-To: <6a2e33620806151522t438040dbved3e70da1f74cec4@mail.gmail.com>
	(Fathi Boudra's message of "Mon\, 16 Jun 2008 00\:22\:21 +0200")
References: <a02c9e436eecc029587d18803589723f@busybox.net>
	<6a2e33620806151522t438040dbved3e70da1f74cec4@mail.gmail.com>
Message-ID: <87y755kggi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fathi" == Fathi Boudra <fboudra@gmail.com> writes:

Hi,

 Fathi>     There's afaik no uclinux (E.G. mmu-less Linux) support for
 Fathi>     powerpc. Why would you want that? What processor are you
 Fathi>     using?


 Fathi> I tried an "allyesconfig" with powerpc/603e build.

Ahh, I'll add !powerpc to the depends for that. 

-- 
Bye, Peter Korsgaard
