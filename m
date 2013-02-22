From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 22 Feb 2013 13:39:18 +0100
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
	errnopatch to 0.9.33.2"
In-Reply-To: <877gm1hhsm.fsf@dell.be.48ers.dk>
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 <877gm1hhsm.fsf@dell.be.48ers.dk>
Message-ID: <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I saw this patch was reverted, so I wonder is there (already or in the making) a way so I can point to a directory in the buildroot
configuration where I have additional ?Clibc patches and a 'series' file ? (similar like the infrastructure for the kernel patches.)
Annoying problem anyway, my app fails at runtime without the patch.

Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: donderdag 21 februari 2013 15:18
Aan: Gustavo Zacarias
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads errnopatch to 0.9.33.2"

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> This reverts commit 1d8c3e6caf6be14644ef8ef5ae2704105322442b
 Gustavo> The forward port breaks compilation at least for SPARC NPTL  Gustavo> toolchains:

Committed, thanks.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
