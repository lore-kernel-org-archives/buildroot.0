From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 18:41:39 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: select EXPAT for freedreno
In-Reply-To: <20210116172722.GP2375@scaer>
References: <20210116160948.1364227-1-festevam@gmail.com>
 <20210116175544.27d53874@gmx.net> <20210116172722.GP2375@scaer>
Message-ID: <20210116174139.GQ2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-16 18:27 +0100, Yann E. MORIN spake thusly:
> On 2021-01-16 17:55 +0100, Peter Seiderer spake thusly:
> > On Sat, 16 Jan 2021 13:09:48 -0300, Fabio Estevam <festevam@gmail.com> wrote:
> > > Select expat when building the freedreno driver to fix the
> > > following error:
[--SNIP--]
> > Not your fault, but maybe worth to check it out (or ask upstream)?
> I'm taking care of that.

MR opened:

    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/8536

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
