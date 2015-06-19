From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Jun 2015 00:47:12 +0200
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: allow disabling
 installation of binary DTBs
In-Reply-To: <20150619210701.GD3638@free.fr>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <20150619203006.GC3638@free.fr> <558480FF.409@je-eigen-domein.nl>
 <20150619210701.GD3638@free.fr>
Message-ID: <20150619224712.GF3638@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-06-19 23:07 +0200, Yann E. MORIN spake thusly:
> On 2015-06-19 22:52 +0200, Floris Bos spake thusly:
> > On 06/19/2015 10:30 PM, Yann E. MORIN wrote:
[--SNIP--]
> > >I'd put the overlays out of the conditional block, because they are
> > >*not* built by the Linux kernel.
> > 
> > They do seem to be part of the rpi Linux source tree:
> > https://github.com/raspberrypi/linux/tree/rpi-3.18.y/arch/arm/boot/dts/overlays
> 
> Ah, indeed. I was mislead by looking at the rpi-4.0.y branch, which does
> not have that sub-directory. But looking further, the overlays are all
> along side the standard DTS, not in a sub-directory.

OK, so I was a bit mislead. I was looking at the rpi-3.19.y branch,
which has all the overlays alongside the standard dts. the rpi-3.18.y
and rpi4.0.y branches indeed have them in a specific sub-dir, as you
pointed out.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
