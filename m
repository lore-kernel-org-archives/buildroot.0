From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 20:02:05 +0100
Subject: [Buildroot] [PATCH v9 1/3] package/weston-imx: Split weston-imx
 off from weston
In-Reply-To: <67840919-8E24-45D8-AA29-58A0E9C58693@walle.cc>
References: <20200202071646.4744-1-james.hilliard1@gmail.com>
 <67840919-8E24-45D8-AA29-58A0E9C58693@walle.cc>
Message-ID: <20200202190205.GA14722@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-02-02 17:42 +0100, Michael Walle spake thusly:
> Am 2. Februar 2020 08:16:44 MEZ schrieb James Hilliard <james.hilliard1@gmail.com>:
> >This is in preparation for migration of weston to the meson build
> >system.
> >Since weston-imx is based off of a much older version of weston it is
> >difficult to maintain as part of the weston package.
> >
> >Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >---
> > package/Config.in                  |   1 +
> > package/weston-imx/Config.in       | 108 ++++++++++++++++++++++
> > package/weston-imx/weston-imx.hash |   2 +
> > package/weston-imx/weston-imx.mk   | 144 +++++++++++++++++++++++++++++
> 
> I'm too late to this since this is already merged.. but now that
> weston-imx is a separate package shouldn't it go into
> packages/freescale-imx/? 

I also considered it, but decided against eventually, with the reasoning
that I prefer to have it next to weston so it bugs me every time I try
to auto-complete /package/west<TAB>, enough so that one day I get enough
and kill it with fire and rage.

Seriously, though, yes, I prefer to have it next to the vanilla one, but
that was just personal preference. Had the patch moved it to the IMX sub
directory, I might have left it there.

Anyway, too late now! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
