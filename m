From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 20:17:41 +0200
Subject: [Buildroot] [PATCH 1/6 v2] package/rpi-firmware: add option to
	install vcdbg
In-Reply-To: <20150630033518.GW3250@tarshish>
References: <cover.1435615426.git.yann.morin.1998@free.fr>
 <87e637df89d62f2944e64f10d4807616435c6c3c.1435615426.git.yann.morin.1998@free.fr>
 <20150630033518.GW3250@tarshish>
Message-ID: <20150630181741.GF3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-06-30 06:35 +0300, Baruch Siach spake thusly:
> On Tue, Jun 30, 2015 at 12:07:41AM +0200, Yann E. MORIN wrote:
> > vcdbg is a tool to help debug the communication with the GPU.
> > It comes as a binary-only, and in two flavours: one for the hard
> > floating point ABI, one for the software floating poitn ABI.
> 
> s/poitn/point/
> 
> > Unfortunately, we have no source code for that tool, only a binary that
> > was dynamically linked with glibc and libraries from rpi-userland.
> 
> Shouldn't it depend on glibc them? Does it run with uClibc*/musl?

No, it does not run with musl or uClibc/uClibc-ng, because it is linked
to libc.so.6.

I'll fix that (and the typo). Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
