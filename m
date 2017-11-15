From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Nov 2017 17:59:15 +0200
Subject: [Buildroot] [PATCH/next 0/5] Add support for MacchiatoBin board
In-Reply-To: <aaad6d28-b49d-9461-e689-94a9826ed0e6@mind.be>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <aaad6d28-b49d-9461-e689-94a9826ed0e6@mind.be>
Message-ID: <20171115155915.em7l5z5gfjvtyb4g@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Nov 14, 2017 at 10:58:43PM +0100, Arnout Vandecappelle wrote:
> On 12-11-17 21:16, Sergey Matyukevich wrote:
> > This patchset adds support for SolidRun MacchiatoBin board based on
> > Marvell Armada 8040 SoC. For convenience the following two different
> > build configurations are added:
> > 
> > - mainline BSP
> >   mainline Linux v4.13.11 and U-Boot v2017.09
> > 
> > - vendor BSP (enables more hardware)
> >   BSP from Marvell based on Linux 4.4.52 and U-Boot v2017.03
> 
>  Do we really want to have defconfigs for both upstream and vendor BSP?
> Especially because we will also probably have a graphical defconfig later...
> This way, we end up with 3-4 defconfigs per board, for dozens of boards...
> 
>  That said, I do think it is useful to have both of these for this specific
> board. It's just that I'm afraid we're going to be overwhelmed by the number of
> defconfigs...
> 
>  What do the others think?

This board has no native graphic interface. So you can think of it as a basic 
(mainline) defconfig, and a fully featured (vendor) defconfig. This is similar 
to the basic and "demo" defconfigs that we have for other boards.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
