From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 25 Oct 2012 20:23:32 +0200
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
 shared library
In-Reply-To: <50897A02.7000407@rie.eu>
References: <50897A02.7000407@rie.eu>
Message-ID: <20121025182332.GC5178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

On Thu, Oct 25, 2012 at 07:42:26PM +0200, Michael Stieler wrote:
> we are using buildroot for arm development. we are migrating from
> arm926t to AM3358 and AM3359.
> 
> i was hoping to continue to use buildroot for the processors, but i
> cannot build the right compiler for these 2.
> 
> in make menuconfig i choose:
> 
> target architecture ARM (big endian)

Why big endian? As far as I know all TI SoCs (as almost all ARM SoCs) are 
little endian.

baruch

> target architecture variant cortex-a8        # for sitara am3358 cortex a8 ?
> toolchain ->  Kernel headers 3.2.x
> package selection for target -> network applications --> X wireless
> tools --> X install shared library
> 
> i need the wireless tools library. liw
> 
> any suggestions ?

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
