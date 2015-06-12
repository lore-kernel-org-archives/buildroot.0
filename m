From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 01:23:28 +0200
Subject: [Buildroot] [PATCH 0/4] core/pkg-kconfig: fix saving back the
 configuration (branch yem/pr8156)
In-Reply-To: <20150612234650.3ed22264@free-electrons.com>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <20150612234650.3ed22264@free-electrons.com>
Message-ID: <20150612232328.GK3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-12 23:46 +0200, Thomas Petazzoni spake thusly:
> On Sat,  6 Jun 2015 13:54:22 +0200, Yann E. MORIN wrote:
> > Yann E. MORIN (4):
> >       core/pkg-kconfig: ensure kconfig file and fragments exist
> >       core/pkg-kconfig: move the kconfig fixups to a macro
> >       core/pkg-kconfig: run the kconfig fixups after exiting configurators
> >       core/pkg-kconfig: allow saving config to a non-existing custom config file
> 
> I've tested the series, and I confirm it fixes the problem for me.

Great!

I'll apply your comment later this WE and will respin then,

Thanks for the review! :-)


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
