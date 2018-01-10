From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jan 2018 19:24:11 +0100
Subject: [Buildroot] [PATCH] qt5wayland: compositor depends on
 BR2_PACKAGE_QT5BASE_OPENGL
In-Reply-To: <f61d8fdc-5da8-b6f7-55e7-b05a29b165d5@microchip.com>
References: <1515457090-29564-1-git-send-email-joshua.henderson@microchip.com>
 <20180109203051.GD3834@scaer>
 <f61d8fdc-5da8-b6f7-55e7-b05a29b165d5@microchip.com>
Message-ID: <20180110182411.GC4296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua, All,

On 2018-01-09 15:56 -0700, Joshua Henderson spake thusly:
> On 01/09/2018 01:30 PM, Yann E. MORIN wrote:
> > On 2018-01-08 17:18 -0700, Joshua Henderson spake thusly:
> >> When building Qt 5.6.3, the qt5wayland compositor depends on Qt OpenGL support.
> > Certainly not. It can also work on EGL/GLES setups as well.
[--SNIP--]
> This patch does not backport easily to qt5wayland 5.6.3, but I'll take a stab at
> re-implementing the same idea in 5.6.3 upstream if this seems valuable (seeing that
> it's always been broken).

Thanks for the feedback. :-)

Please note that you can not backport a patch from 5.7 or later to 5.6,
because the licensing terms have changed.

Ok, this is more complex than that, since qtwayland was a new module in
5.6, so may have already been under the same licensing terms, but this
should be verified thouroughly before attemting a backport...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
