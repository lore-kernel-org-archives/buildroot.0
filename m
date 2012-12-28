From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Dec 2012 10:06:15 +0100
Subject: [Buildroot] [PATCH] package/keyutils: disable on avr32 &
	microblaze
In-Reply-To: <1356650436-20697-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 28 Dec 2012 00:20:36 +0100")
References: <1356650436-20697-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ehia1r7c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> keyutils builds on neither avr32, nor microblaze (probably because
 Yann> the toolchains used fot those archictectures are way too old), with:

s/fot/for/

Committed with that fixed, thanks both!

-- 
Bye, Peter Korsgaard
