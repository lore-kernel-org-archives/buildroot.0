From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Sep 2015 21:04:33 +0300
Subject: [Buildroot] [PATCH] ipmiutil: fix musl build issues
In-Reply-To: <20150929194408.52056667@free-electrons.com>
References: <51df17fb14e304d239fda9b67a6d08ff197dd322.1443508577.git.baruch@tkos.co.il>
 <20150929194408.52056667@free-electrons.com>
Message-ID: <20150930180433.GD2309@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 29, 2015 at 07:44:08PM +0200, Thomas Petazzoni wrote:
> On Tue, 29 Sep 2015 09:36:17 +0300, Baruch Siach wrote:
> > Add patches fixing a number of build failures under musl.
> > 
> > The first patch fixes the following autobuild failures:
> > http://autobuild.buildroot.net/results/bc8/bc8f97f0739e5b842057fdf60eb9309c3e30fac1/
> > http://autobuild.buildroot.net/results/937/937163f988bb3680630544f6c0ed45b18bc83511/
> > http://autobuild.buildroot.net/results/862/862af4c6be4b78e65528195305653eedac4163c6/
> > 
> > and others.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  .../ipmiutil/0004-avoid-wchar-t-redefinition.patch | 19 ++++++++++++++++
> >  .../0005-add-missing-param.h-header-include.patch  | 24 ++++++++++++++++++++
> >  .../0006-add-missing-sys-select.h-include.patch    | 26 ++++++++++++++++++++++
> >  3 files changed, 69 insertions(+)
> >  create mode 100644 package/ipmiutil/0004-avoid-wchar-t-redefinition.patch
> >  create mode 100644 package/ipmiutil/0005-add-missing-param.h-header-include.patch
> >  create mode 100644 package/ipmiutil/0006-add-missing-sys-select.h-include.patch
> 
> Applied, thanks. Please submit your patches upstream, since upstream
> seems to be active (commits from a few days/weeks ago on the Git
> repository).

Thanks. I sent upstream these patches, and a few more 
(http://sourceforge.net/p/ipmiutil/mailman/message/34503555/).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
