From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 17:33:10 +0100
Subject: [Buildroot] [PATCH] package/qemu: fix specifying custom target
	sub-set
In-Reply-To: <1415452409-1500-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 8 Nov 2014 14:13:29 +0100")
References: <1415452409-1500-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87bnohveih.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The logic was wrong.
 > Even though it was working for previous versions of QEMU, it changed in
 > later versions, and thus now breaks on the version we currently package.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Note: I did not notice so far because I always enabled a full-blown
 > configure with all emulations enabled.

Committed, thanks.

-- 
Bye, Peter Korsgaard
