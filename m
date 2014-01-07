From: Mike Zick <minimod@morethan.org>
Date: Tue, 7 Jan 2014 07:58:14 -0600
Subject: [Buildroot] [PATCH] libdmtx: add license information
In-Reply-To: <CA+-urNTa1LZ-95nFPNN=PMMChMNPSqE3zj64DZLix2TqrXhgTg@mail.gmail.com>
References: <1389024846-17491-1-git-send-email-fhunleth@troodon-software.com>
 <20140107053558.GE4503@tarshish>
 <CA+-urNTa1LZ-95nFPNN=PMMChMNPSqE3zj64DZLix2TqrXhgTg@mail.gmail.com>
Message-ID: <20140107075814.19ea98c9@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 7 Jan 2014 08:48:37 -0500
Frank Hunleth <fhunleth@troodon-software.com> wrote:

> Hi Baruch,
> 
> On Tue, Jan 7, 2014 at 12:35 AM, Baruch Siach <baruch@tkos.co.il>
> wrote:
> >
> > Hi Frank,
> >
> > On Mon, Jan 06, 2014 at 11:14:06AM -0500, Frank Hunleth wrote:
> > > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> > > ---
> > >  package/libdmtx/libdmtx.mk | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/package/libdmtx/libdmtx.mk
> > > b/package/libdmtx/libdmtx.mk index 69c7b88..43b35ec 100644
> > > --- a/package/libdmtx/libdmtx.mk
> > > +++ b/package/libdmtx/libdmtx.mk
> > > @@ -6,6 +6,8 @@
> > >
> > >  LIBDMTX_VERSION = 0.7.4
> > >  LIBDMTX_SITE =
> > > http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
> > > +LIBDMTX_LICENSE = BSD-2c or Commercial license
> > > +LIBDMTX_LICENSE_FILES = LICENSE
> >
> > The "alternate terms" section in the LICENSE file states:
> >
> > > Redistributions in binary form, with or without modification, are
> > > permitted without including the above copyright notice, list of
> > > conditions, and disclaimer if express written permission has been
> > > obtained from Dragonfly Logic, Inc.
> >
> > I wouldn't call this written permission a "commercial license", but
> > IANAL.
> 
> Yeah, I almost called it "alternate terms", but that felt too vague.
> It seemed like most other packages used the words "commercial license"
> when you could contact the author/company to get out of open source
> license obligations. However, if there's some other language that
> better describes this, then I'll certainly modify the patch. I just
> don't know what those words are.
> 
> Thanks,
> Frank
> 

BSD-2c or Special Permission

Those are the words, but "or Special Permission (of the author)" is
a null statement - it is always true.

Mike
> >
> > baruch
> >
> > >  LIBDMTX_INSTALL_STAGING = YES
> > >
> > >  $(eval $(autotools-package))
> > > --
> > > 1.8.3.2
> >
> > --
> >      http://baruch.siach.name/blog/                  ~. .~   Tk
> > Open Systems
> > =}------------------------------------------------ooO--U--Ooo------------{=
> >    - baruch at tkos.co.il - tel: +972.2.679.5364,
> > http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
