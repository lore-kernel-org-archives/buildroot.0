From: Ossy <ossy1980@gmx.net>
Date: Fri, 18 Jun 2010 23:28:07 +0200
Subject: [Buildroot] [git commit master 1/1] uClibc: 0.9.31.config:
 enable UCLIBC_SV4_DEPRECATED option
In-Reply-To: <87pqzo9gwj.fsf@macbook.be.48ers.dk>
References: <20100618114218.78624816CD@busybox.osuosl.org>	<4C1BDF9B.7000106@gmx.net>
	<87pqzo9gwj.fsf@macbook.be.48ers.dk>
Message-ID: <4C1BE4E7.4000404@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 18.06.2010 23:20, schrieb Peter Korsgaard:
>>>>>> "Ossy" == Ossy<ossy1980@gmx.net>  writes:
>
>   Ossy>  Hi,
>   Ossy>  Maybe it's known, but it is not only SV4_DEPR. I was forced to
>   Ossy>  activate "OBSOLETE BSD SIGNALS" too. SV4 is not sufficient for a
>   Ossy>  successful build.
>
>   Ossy>  xfsprogs/Config.in:
>   Ossy>  "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and
>   Ossy>  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
>
> Strange. I did see the comment, but it built here without.

I tried it out myself without OBSOLETE_BSD_SIGNALS (after spotted your 
commit). But in fact BSD-Signals are mandatory (at least for me). I'm 
using Debian squeeze and the same config as I sent in for rsync and 
squashtools.
