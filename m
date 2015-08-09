From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 9 Aug 2015 23:03:30 +0300
Subject: [Buildroot] [PATCH/next 1/1] package/jsoncpp: bump version to
 1.6.5
In-Reply-To: <1439143511.12501.11.camel@embedded.rocks>
References: <1439123310-6602-1-git-send-email-bernd.kuhls@t-online.de>
 <20150809145443.GB2570@tarshish>
 <1439143511.12501.11.camel@embedded.rocks>
Message-ID: <20150809200330.GE2570@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Sun, Aug 09, 2015 at 08:05:11PM +0200, J?rg Krause wrote:
> On So, 2015-08-09 at 17:54 +0300, Baruch Siach wrote:
> > On Sun, Aug 09, 2015 at 02:28:30PM +0200, Bernd Kuhls wrote:
> > > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > > ---
> > >  .../jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch | 12 
> > > +++++++-----
> > >  package/jsoncpp/jsoncpp.mk                                   |  2 
> > > +-
> > >  2 files changed, 8 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > > -snprintf.patch b/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > > -snprintf.patch
> > > index 7935849..1178cc2 100644
> > > --- a/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > > -snprintf.patch
> > > +++ b/package/jsoncpp/0001-Revert-Use-std-namespace-for
> > > -snprintf.patch
> > > @@ -16,6 +16,8 @@ Upstream status: sent upstream
> > >  package/jsoncpp/0001-Revert-Use-std-namespace-for-snprintf.patch
> > >  
> > >  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > > +(bumped patch to jsoncpp 1.6.5)
> > > +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > 
> > I think this patch is not needed anymore. See 
> > https://github.com/open-source-parsers/jsoncpp/pull/232. I haven't 
> > tested though.
> 
> I already submitted a patch for jsoncpp version bump and removing the
> snprintf-patch: http://patchwork.ozlabs.org/patch/502324/

Right. Except that your pull request (#323) has been merged since then. Care 
to send an updated patch with current -Werror removal patch status?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
