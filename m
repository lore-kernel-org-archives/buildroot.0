From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 5 Nov 2017 08:07:49 +0200
Subject: [Buildroot] [PATCH 1/1] docs: update DEVELOPERS modification
 process
In-Reply-To: <20171104231427.3b3f436a@windsurf>
References: <20171103211053.20886-1-joseph.kogut@gmail.com>
 <20171104185305.5vkjjg6iwrhctcis@tarshish>
 <20171104231427.3b3f436a@windsurf>
Message-ID: <20171105060749.p5d7vwxbdveg67ck@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Nov 04, 2017 at 11:14:27PM +0100, Thomas Petazzoni wrote:
> On Sat, 4 Nov 2017 20:53:05 +0200, Baruch Siach wrote:
> 
> > > diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> > > index a58945f395..8bbc2b9eb7 100644
> > > --- a/docs/manual/contribute.txt
> > > +++ b/docs/manual/contribute.txt
> > > @@ -260,9 +260,9 @@ options that no longer exist or are no longer needed.
> > > 
> > >  If you are interested in getting notified of build failures and of
> > >  further changes in the packages you added or modified, please add
> > > -yourself to the DEVELOPERS file. This should be done in a separate
> > > -patch of the series. See xref:DEVELOPERS[the DEVELOPERS file] for more
> > > -information.
> > > +yourself to the DEVELOPERS file. This should be done in the same patch
> > > +creating or modifying the package. See xref:DEVELOPERS[the DEVELOPERS file]
> > > +for more information.  
> > 
> > Not sure about "or modifying". Mixing a DEVELOPERS update into a random 
> > package update does not always make sense. The manual only refers to new 
> > packages/boards. I suggest to drop this sentence entirely, and leave the 
> > details for the manual.
> 
> Joseph is modifying the manual here, so I'm not sure what your last
> sentence means.

Ah. For some reason I had the impression that this change is against the 
DEVELOPERS file itself. So let me rephrase my suggestion:

  I suggest to drop this sentence entirely, and leave the details for the 
  DEVELOPERS manual section.

> However, I agree that doing the DEVELOPERS change in a patch just
> modifying the package is perhaps not desirable. When adding a new
> package, yes, definitely, the DEVELOPERS entry should be added as part
> of the same patch. However, when a package is being modified, that's a
> different story, and the package change should be in a separate patch
> than the DEVELOPERS addition.

Agreed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
