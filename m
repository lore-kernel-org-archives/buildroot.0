From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Jun 2015 06:35:18 +0300
Subject: [Buildroot] [PATCH 1/6 v2] package/rpi-firmware: add option to
	install vcdbg
In-Reply-To: <87e637df89d62f2944e64f10d4807616435c6c3c.1435615426.git.yann.morin.1998@free.fr>
References: <cover.1435615426.git.yann.morin.1998@free.fr>
 <87e637df89d62f2944e64f10d4807616435c6c3c.1435615426.git.yann.morin.1998@free.fr>
Message-ID: <20150630033518.GW3250@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Jun 30, 2015 at 12:07:41AM +0200, Yann E. MORIN wrote:
> vcdbg is a tool to help debug the communication with the GPU.
> It comes as a binary-only, and in two flavours: one for the hard
> floating point ABI, one for the software floating poitn ABI.

s/poitn/point/

> Unfortunately, we have no source code for that tool, only a binary that
> was dynamically linked with glibc and libraries from rpi-userland.

Shouldn't it depend on glibc them? Does it run with uClibc*/musl?

> So, just install that executable, and let's hope there is no symbol
> issue at runtime.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
