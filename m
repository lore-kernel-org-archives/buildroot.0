From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Sep 2015 12:36:46 +0300
Subject: [Buildroot] [PATCH v3 1/5] dos2unix: add target support
In-Reply-To: <874mjamde8.fsf@dell.be.48ers.dk>
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
 <874mjamde8.fsf@dell.be.48ers.dk>
Message-ID: <20150906093646.GD2213@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Sep 04, 2015 at 05:07:27PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > From: James Knight <james.knight@rockwellcollins.com>
>  > Allow the `dos2unix` utility to be built and installed on the target
>  > system.
> 
>  > [baruch: properly handle target gettext]
>  > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  > v3:
>  >   * Show only if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is enabled (Peter)
>  >   * Add busybox to _DEPENDENCIES
> 
> Committed series, thanks!

Thanks. All patches except the last one (5/5: dos2unix: update homepage link) 
are in the master branch. What happened to the last one?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
