From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Apr 2011 23:01:24 +0200
Subject: [Buildroot] Problems using buildroot with crosstoll-ng
In-Reply-To: <201104171740.17634.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Sun, 17 Apr 2011 17:40:17 +0200")
References: <BANLkTik6g3rhC1_WfRLkBodNVsOUhjKaJA@mail.gmail.com>
	<201104171740.17634.yann.morin.1998@anciens.enib.fr>
Message-ID: <87tydu3qhn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 >> The fist problem I faced was the following:
 >> CTNG_TUPLE='mipsel-unknown-linux-gnu'
 >> CTNG_SYSROOT='/home/tora/Projects/buildroot-2011.02/output/host/
 >> usr/mipsel-unknown-linux-gnu/sys-root' 
 Yann>                                ^^^^^^^^
 Yann> Bummer... There's an issue here.
 Yann> It should be 'sysroot', not 'sys-root'. I'm testing a fix here.

I noticed that as well earlier today, and fixed it in git.

-- 
Bye, Peter Korsgaard
