From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Feb 2012 19:17:16 +0200
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <63D6870D443E63419AC4A0C97B86C092030FCA18@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C092030FCA15@MBXCLUSTER.mdh.local>
 <20120223123856.GG26667@sapphire.tkos.co.il>
 <63D6870D443E63419AC4A0C97B86C092030FCA18@MBXCLUSTER.mdh.local>
Message-ID: <20120223171716.GA5622@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikael,

Please keep the list in Cc.

On Thu, Feb 23, 2012 at 02:35:37PM +0100, Mikael ?sberg wrote:
> Hi,
> 
> Thanks a lot for the info!
> 
> I guess its easier to use Barebox, then you just also specify mxs_defconfig 
> when you configure.

You original question was about the Linux kernel not Barebox.

Barebox includes support for the TX28 board which is based on i.MX28 
(tx28stk5_defconfig).

> One more thing, since i.MX28 uses the "454MHz ARM926EJ-S" processor, should 
> I choose "arm926t" in the config?

The kernel (and Barebox) defconfig files should include all the relevant 
settings, including this one.

baruch

> Fr?n: Baruch Siach [baruch at tkos.co.il]
> Skickat: den 23 februari 2012 13:38
> Till: Mikael ?sberg
> Kopia: buildroot at busybox.net
> ?mne: Re: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
> 
> Hi Mikael,
> 
> On Thu, Feb 23, 2012 at 12:22:09PM +0100, Mikael ?sberg wrote:
> > Does anyone have experience with compiling Linux kernels with Buildroot for
> > i.MX28 EVK?
> > I'm not sure which board name to be set for u-boot for example...
> > Also, which defconfig should be used, imx27ads_defconfig or versatile_defconfig perhaps?
> >
> > Any help or pointers would be valueable!
> 
> Although it's named i.MX28, this chip is very different from i.MX27, but is
> similar to i.MX23. Latest kernels (since v3.0) contain mxs_defconfig, which
> should be suitable for i.MX28 (and i.MX23).
> 
> baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
