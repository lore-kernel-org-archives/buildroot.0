From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Feb 2018 16:53:38 +0200
Subject: [Buildroot] [PATCH RFC] 18xx-ti-utils: new package
In-Reply-To: <20180214153755.4c365154@windsurf.lan>
References: <f92c71ab69063c62e8562b05062a70fdb91b187f.1518613483.git.baruch@tkos.co.il>
 <20180214153755.4c365154@windsurf.lan>
Message-ID: <20180214145338.5gg447eaace556y7@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 14, 2018 at 03:37:55PM +0100, Thomas Petazzoni wrote:
> On Wed, 14 Feb 2018 15:04:43 +0200, Baruch Siach wrote:
> > These are spacial RF calibration utilities for the TI Wilink 18xx
> > modules.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > 
> > I encountered strange behaviour with this package. Simple 'make' does
> > not build the package even when 'BR2_18XX_TI_UTILS=y' is in my .config.
> 
> Well, because it should be BR2_PACKAGE_<something>...
> 
> > +config BR2_18XX_TI_UTILS
> 
> ... here.

Thanks. I had the feeling that this is something obvious.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
