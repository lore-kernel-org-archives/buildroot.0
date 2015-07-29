From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jul 2015 22:58:12 +0200
Subject: [Buildroot] [PATCH 2/3] package/xserver: commonalise dependency
 on libdrm
In-Reply-To: <20150729225257.1dbe308d@free-electrons.com>
References: <cover.1437950027.git.yann.morin.1998@free.fr>
 <4368a6cd5cf0f903bc2e0dd756b413b9ed8378ad.1437950027.git.yann.morin.1998@free.fr>
 <20150729225257.1dbe308d@free-electrons.com>
Message-ID: <20150729205812.GA3722@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thoms, All,

On 2015-07-29 22:52 +0200, Thomas Petazzoni spake thusly:
> On Mon, 27 Jul 2015 00:35:11 +0200, Yann E. MORIN wrote:
> > +XSERVER_XORG_SERVER_NEEDS_LIBDRM = y
> 
> Shouldn't we use an hidden Config.in boolean instead for this?

That's an option, yes. I'll do that later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
