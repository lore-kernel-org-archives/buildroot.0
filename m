From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Feb 2012 14:38:56 +0200
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <63D6870D443E63419AC4A0C97B86C092030FCA15@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C092030FCA15@MBXCLUSTER.mdh.local>
Message-ID: <20120223123856.GG26667@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikael,

On Thu, Feb 23, 2012 at 12:22:09PM +0100, Mikael ?sberg wrote:
> Does anyone have experience with compiling Linux kernels with Buildroot for 
> i.MX28 EVK?
> I'm not sure which board name to be set for u-boot for example...
> Also, which defconfig should be used, imx27ads_defconfig or versatile_defconfig perhaps?
> 
> Any help or pointers would be valueable!

Although it's named i.MX28, this chip is very different from i.MX27, but is 
similar to i.MX23. Latest kernels (since v3.0) contain mxs_defconfig, which 
should be suitable for i.MX28 (and i.MX23).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
