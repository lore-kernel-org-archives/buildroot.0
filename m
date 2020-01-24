From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2020 18:53:57 +0100
Subject: [Buildroot] BR2_EXTERNAL and linux-ext-*.mk
In-Reply-To: <CAEyMn7arGF8nDmnS4boDoHNZHCbU05DZR=ZEuNYLid66RONzhw@mail.gmail.com>
References: <CAEyMn7a2qBj2efokN1Au3qek8yNsg_hdjBzntkiC8nCFZ5M=rg@mail.gmail.com>
 <20200123214412.GZ32369@scaer>
 <CAEyMn7arGF8nDmnS4boDoHNZHCbU05DZR=ZEuNYLid66RONzhw@mail.gmail.com>
Message-ID: <20200124175357.GB32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-01-24 08:19 +0100, Heiko Thiery spake thusly:
> Am Do., 23. Jan. 2020 um 22:44 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> > On 2020-01-23 22:08 +0100, Heiko Thiery spake thusly:
> > > I recently recognized that there is the support to have linux patches
> > > located in the BR2_EXTERNAL/linux directory with
> > > c26eafa96cabd597a5cce534133ee0ff996b800c.
[--SNIP--]
> > > ----------  with BR2_EXTERNAL/linux/linux-ext-xxx.mk:
> > [--SNIP--]
> > > # make printvars VARS=LINUX_PKGDIR
> > > LINUX_PKGDIR=/home/hthiery/sources/test-linux/buildroot-external-linux-test/linux/
> > > ----------
[--SNIP--]
> > Care to test and properly send: http://code.bulix.org/4fcw7l-1104853?raw
> I just tested the changes and indeed this solves the problem. How to
> handle the change?

Thanks for testing! I'll send a proper patch some time later tonight...

> Should I open a bug in bugzilla for tracking?

No need for that.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
