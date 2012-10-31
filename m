From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 31 Oct 2012 16:52:49 +0200
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <20121031153101.41b26063@skate>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <20121031114118.GF30343@sapphire.tkos.co.il>
 <20121031153101.41b26063@skate>
Message-ID: <20121031145249.GJ30343@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 31, 2012 at 03:31:01PM +0100, Thomas Petazzoni wrote:
> On Wed, 31 Oct 2012 13:41:18 +0200, Baruch Siach wrote:
> > > Does anybody have any solution?
> > 
> > This is a toolchain level problem. Either downgrade to a toolchain with 2.13 
> > glibc, or use a toolchain with tirpc.
> 
> I have posted a patch set some time ago that fixes this. It tells
> Buildroot whether the toolchain has RPC support or not (even for
> glibc/eglibc toolchains), and then is capable of building libtirpc when
> the toolchain does not provide RPC support.
> 
> I intend to adjust a few things and update it, before resending it.
> Maybe before the Buildroot meeting this week-end, maybe after.

Well, this only solves the problem for internal toolchains, isn't it?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
