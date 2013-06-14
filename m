From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Jun 2013 00:55:56 +0200
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
In-Reply-To: <CADXR8ejLiDw3ZDR3iBRfYKBqqJ5abS5OSV=cGqXChxKvsPHioA@mail.gmail.com>
References: <CADXR8ejLiDw3ZDR3iBRfYKBqqJ5abS5OSV=cGqXChxKvsPHioA@mail.gmail.com>
Message-ID: <20130614225556.GA3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Soochaon, All,

On 2013-06-14 16:24 -0400, soochon radee spake thusly:
> I know I'm chiming in late here, but I actively use ctng to build an eglibc
> toolchain within buildroot. I hope that you can retain it until Thomas's
> successor is in and running.

I understand your, and other's, concern, and that's why the support for
the ct-ng backend was not removed, and only marked deprecated.

I have always thought that te best course of action in this respect was
to have a toolchain pre-built once and for all, and that this toolchain
be used by Buildroot as an external toolchain.

I do not understand why people insist on building the toolchain everytime
from within Buildroot. Even on my fast machine, it takes almost as much
time as it takes to build the packages, if not more.

That the possibility exists (in its current, not-so-limited uClibc-based
incarnation) for beginners I understand. But not for sustained work.

This means that I won't push updates to the Buildroot ct-ng backend
anymore.

But, by popular demand, I'll also refrain from posting a patch that
removes it entirely! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
