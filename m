From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 30 Sep 2019 10:44:23 -0400
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov as contact
 for BeagleBone defconfigs
In-Reply-To: <CAGm1_kuHiP2PrQnVK39X+2bH8QKZwaJzhNYEY6JWrhjjHyO0hg@mail.gmail.com>
References: <20190927085903.25001-1-yegorslists@googlemail.com>
 <CAGm1_kuHiP2PrQnVK39X+2bH8QKZwaJzhNYEY6JWrhjjHyO0hg@mail.gmail.com>
Message-ID: <CA+-urNQ1-kZdEvRZ=B-h8qAVyVedFQBuSpfU5mDqeWAEF+kVtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Fri, Sep 27, 2019 at 7:48 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Frank,
>
> On Fri, Sep 27, 2019 at 10:59 AM <yegorslists@googlemail.com> wrote:
> >
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  DEVELOPERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 69d2ed6272..2764b2422b 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2438,6 +2438,8 @@ F:        package/zisofs-tools/
> >  F:     support/download/
> >
> >  N:     Yegor Yefremov <yegorslists@googlemail.com>
> > +F:     configs/beaglebone_defconfig
> > +F:     configs/beaglebone_qt5_defconfig
> >  F:     package/acl/
> >  F:     package/attr/
> >  F:     package/bluez_utils/
>
> do you still have the hw? Could you also register yourself for this board?

I use several of the BeagleBones, but I only use Robert Nelson's patch
set (aka the beaglebone.org Debian patch set) in my projects. It's
unfortunately quite large. Here's an example:
https://rcn-ee.net/deb/buster-armhf/v4.19.72-bone39/. I use it since
it has helped me with driver and device tree issues in the past. I
could believe that those issues are fixed in a vanilla kernel now, but
I haven't checked. Since I have a different kernel setup, I've been
shy about contributing any I've done with the BeagleBone back.

> Another question why do we use TI's kernel and not the vanilla one?
