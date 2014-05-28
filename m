From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 May 2014 09:59:58 +0200
Subject: [Buildroot] [PATCH] package/exim: fix static linking
In-Reply-To: <1401263274-12833-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 28 May 2014 09:47:54 +0200")
References: <1401263274-12833-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fvjucozl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > When building static, we need to tell exim that it needs to link
 > statically (obviously), and that it should link against pthreads.

 > Yet, exim is still not happy with that, as it still wants to build
 > something (a version-related program) at install time, so we need
 > to replicate the ld flags at install time.

Committed with the autobuilder link added, thanks.

-- 
Bye, Peter Korsgaard
