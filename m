From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 6 Apr 2010 18:42:56 +0200
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
In-Reply-To: <hpfh61$drp$1@dough.gmane.org>
References: <hpfh61$drp$1@dough.gmane.org>
Message-ID: <201004061842.56577.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant,

On Tuesday 06 April 2010 16:41:05 Grant Edwards wrote:
> I've been using external toolchains built by buildroot since it's so
> much simpler than using crosstool-NG: you don't have to build and
> install buildroot like you do crosstool-NG, and I already have
> buildroot under source control.  Now I'll also have to place
> crosstool-NG (both sources and installed files) under version control.

There is also what I call "the hacker's way" to use crostool-NG, where there
is no need to install it, and hwere you can run from the source tree.

  ./configure --local
  make
  ./ct-ng

(See docs/overview.txt if you want to know why I call that "the hacker's way").

Regards,
Yann E. MORIN.

PS. Oh, and by the way, the canonical address for the mailing list is:
    buildroot at busybox.net (at least it's advertised as such on the 
    ML webpage, in the List- headers, and in the welcome message).
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
