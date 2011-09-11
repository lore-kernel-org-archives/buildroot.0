From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Sep 2011 23:05:21 +0200
Subject: [Buildroot] [PATCH 1/4] package/binutils: fixup version strings
	1/2
In-Reply-To: <1315755490-9920-2-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Sun, 11 Sep 2011 17:38:07 +0200")
References: <1315755490-9920-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1315755490-9920-2-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87pqj6eqni.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> The binutils tarballs have been re-released after a GPL compliance
 Yann> issue was found:
 Yann>   http://sourceware.org/ml/binutils/2011-08/msg00198.html

 Yann> So all versions were re-packaged.

 Yann> In the process, two things happenned:
 Yann>  - some versions (eg. 2.19) went missing, due to them being super-seeded
 Yann>    by a dot release (eg. 2.19.1)
 Yann>  - an 'a' was appended to the version strings

 Yann> So, this patch fixes the first issue by removing no-longer available
 Yann> versions (including patch dirs).

But mips/mipself/sh/uClibc 0.9.30 uses 2.21 as 2.21.1 doesn't work - So
we'll need to fix that (use 2.19.1 instead?)

-- 
Bye, Peter Korsgaard
