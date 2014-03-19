From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Mar 2014 19:35:23 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain
 target to the TARGETS variable
In-Reply-To: <532983A0.9050107@mind.be>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
 <5326A778.7070507@mind.be>
 <CAHkwnC8+MsDLUd5XMU1GDmfNBCVU0p9JTaUmpWiYReTrSsAnKQ@mail.gmail.com>
 <532983A0.9050107@mind.be>
Message-ID: <20140319183523.GA3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, Arnout, All,

On 2014-03-19 12:46 +0100, Arnout Vandecappelle spake thusly:
> On 19/03/14 12:10, Fabio Porcedda wrote:
[--SNIP--]
> > Take in account that the "toolchain" target is always built because is
> > a dependency of the "busybox" package that is always build and cannot
> > be disabled and
> > the "toolchain-buildroot" and "toolchain-external" are always enabled
> > in the Config.in.
> 
>  busybox can be disabled (if you set the init system to "none").

Indeed, and I very often uses that when I want to just test a single
package I'm adding.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
