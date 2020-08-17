From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Aug 2020 09:28:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: fix missing
 __exchange_and_add symbol
In-Reply-To: <CADvTj4oYoW71OET1Zp829y3PJY-Anx8xhChBATdCsGnXv5xQdw@mail.gmail.com>
References: <20200513073537.17950-1-james.hilliard1@gmail.com>
 <20200513112247.146a1477@windsurf.home>
 <CADvTj4oYoW71OET1Zp829y3PJY-Anx8xhChBATdCsGnXv5xQdw@mail.gmail.com>
Message-ID: <20200817072802.GN24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-13 03:43 -0600, James Hilliard spake thusly:
> On Wed, May 13, 2020 at 3:22 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Wed, 13 May 2020 01:35:37 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> > > It seems libsupc++.a is missing __exchange_and_add for uclibc on some
> > > platforms so link with libstdc++ as well on sparc and arcle.
[--SNIP--]
> > Meh. We really want to fix that in uClibc, if it's a uClibc issue.
> Well no idea if it's a bug in uClibc but the failures seem to be
> limited to builds
> using uClibc. The libsupc++.a library appears to be originating from
> gcc, I don't
> really know why this issues seems to be specific to uClibc and those 2 archs.

Pleas see the reply I wrote to another similar patch:

    http://lists.busybox.net/pipermail/buildroot/2020-August/289411.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
