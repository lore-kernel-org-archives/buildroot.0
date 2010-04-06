From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 6 Apr 2010 18:10:02 +0000 (UTC)
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
References: <hpfh61$drp$1@dough.gmane.org>
	<201004061842.56577.yann.morin.1998@anciens.enib.fr>
Message-ID: <hpftdq$3b3$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-06, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:
> Grant,
>
> On Tuesday 06 April 2010 16:41:05 Grant Edwards wrote:
>> I've been using external toolchains built by buildroot since it's so
>> much simpler than using crosstool-NG: you don't have to build and
>> install buildroot like you do crosstool-NG, and I already have
>> buildroot under source control.  Now I'll also have to place
>> crosstool-NG (both sources and installed files) under version control.
>
> There is also what I call "the hacker's way" to use crostool-NG, where there
> is no need to install it, and hwere you can run from the source tree.

Yup, I found that right after I posted that message.  That would make
version control simpler.

> PS. Oh, and by the way, the canonical address for the mailing list
>     is: buildroot at busybox.net (at least
>     it's advertised as such on the ML webpage, in the List- headers,
>     and in the welcome message).

I post via gmane.org's nntp server.  If it's posting to the wrong
address, let me know and I'll contact gmane's admin to try to get it
fixed.

-- 
Grant Edwards               grant.b.edwards        Yow! My face is new, my
                                  at               license is expired, and I'm
                              gmail.com            under a doctor's care!!!!
