From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 27 Sep 2019 17:06:33 -0600
Subject: [Buildroot] [PATCH 2/2] sdl2_image: bump to version 2.0.5
In-Reply-To: <20190927232157.4f35fd2e@windsurf>
References: <20190923231543.21874-1-peter.macleod.thompson@gmail.com>
 <20190923231543.21874-2-peter.macleod.thompson@gmail.com>
 <20190927232157.4f35fd2e@windsurf>
Message-ID: <CAGrGpJDHxyaXQNOkSZtdqXXAaDLzwGfpU2pQdg-Z9u0wrs-waA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
Thanks for fixing and applying all 3 patches.
Peter


On Fri, Sep 27, 2019 at 3:21 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Mon, 23 Sep 2019 17:15:43 -0600
> Peter Thompson <peter.macleod.thompson@gmail.com> wrote:
>
> > From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> >
> > bump sdl2_image from version 2.0.3 to version 2.0.5
> > for upgrade to latest version
> >
> > Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> > ---
> >  package/sdl2_image/sdl2_image.hash | 6 +++---
> >  package/sdl2_image/sdl2_image.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/sdl2_image/sdl2_image.hash
> b/package/sdl2_image/sdl2_image.hash
> > index cf3253526c..7eb85158d3 100644
> > --- a/package/sdl2_image/sdl2_image.hash
> > +++ b/package/sdl2_image/sdl2_image.hash
> > @@ -1,3 +1,3 @@
> > -# Locally calculated
> > -sha256
> 3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368
> SDL2_image-2.0.3.tar.gz
> > -sha256
> 13240ed78c8726c510b9634976430d3d3a9ea2d1ced3214119766e9e71568a35
> COPYING.txt
> > +# Locally calculated
>
> You introduced a trailing white space here.
>
> > +sha256
> bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0
> SDL2_image-2.0.5.tar.gz
> > +sha256
> 45079362e2230154205413a6940544ca94e3479ccf76205c71c4f542a6815d25
> COPYING.txt
>
> And changed the hash of the license file without providing any
> explanation in the commit log.
>
> I fixed both issues, adjusted the commit title, and applied. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190927/34048c1d/attachment.html>
