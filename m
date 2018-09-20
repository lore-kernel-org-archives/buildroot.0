From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 16:38:32 -0500
Subject: [Buildroot] [PATCH 11/14] package/tidsp-binaries: URL update
In-Reply-To: <20180920213922.6f5fbfa7@windsurf>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-11-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920213922.6f5fbfa7@windsurf>
Message-ID: <CANQCQpYi0prZ1UUGBoqGXwTO11qXdL5Br1CGbBhQyACrMT4HAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Sep 20, 2018 at 2:39 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 20 Sep 2018 08:24:56 -0500, Matt Weber wrote:
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/tidsp-binaries/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/tidsp-binaries/Config.in b/package/tidsp-binaries/Config.in
> > index 48f85a5..24b2891 100644
> > --- a/package/tidsp-binaries/Config.in
> > +++ b/package/tidsp-binaries/Config.in
> > @@ -4,4 +4,4 @@ config BR2_PACKAGE_TIDSP_BINARIES
> >       help
> >         TI OMAP3 DSP algorithms.
> >
> > -       https://gforge.ti.com/gf/project/openmax/
> > +       http://omappedia.org/wiki/OpenMAX_Project
>
> Is that really the right URL ? It points to gforge.ti.com, which indeed
> seems to be down. Should we simply drop this package perhaps ? The
> upstream site is not available, I doubt anybody is using it: it was
> introduced in 2011 and never touched again in any useful/meaningful way.
>
> So I would propose to drop this package.

This package is used by dsp-tools and gstreamer/gst-dsp so I'd assume
those should also be removed.

This capability feels feature complete when looking at the Gstreamer
stuff....  I guess we'll see if anyone notices the removal.  Should I
have 3 seperate patches for the individual packages?

Matt
