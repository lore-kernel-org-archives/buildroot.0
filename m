From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 20 Jun 2011 14:53:17 +0000
Subject: [Buildroot] prefer static libraries question
In-Reply-To: <BANLkTin+4A__GeOps=bWw7+oCKG+=jbCgQ@mail.gmail.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99AC7E@EXV1.corp.adtran.com>
 <201104121836.55644.vapier@gentoo.org> <20110422152527.7ec95de5@surf>
 <201106181447.28438.vapier@gentoo.org>
 <BANLkTin+4A__GeOps=bWw7+oCKG+=jbCgQ@mail.gmail.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6035FCB@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Bernhard Reutner-Fischer
> Sent: Saturday, June 18, 2011 2:38 PM
> To: Mike Frysinger
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] prefer static libraries question
> 
> 
> On Jun 18, 2011 8:47 PM, "Mike Frysinger" <vapier@gentoo.org>
> wrote:
> >
> > On Friday, April 22, 2011 09:25:27 Thomas Petazzoni wrote:
> > > On Tue, 12 Apr 2011 18:36:54 -0400 Mike Frysinger wrote:
> > > > might be better to rename or add a new option.  then the
> build logic
> > > > is clear: if user *prefers* static linking, we'll still
> build/install
> > > > shared libs, but we'll generate static programs everywhere.
> if the
> > > > user *only* wants static builds, then we can skip the shared
> lib
> > > > stuff entirely.
> > >
> > > Does the "prefers" use case really makes sense ? I have always
> found
> > > our BR2_PREFER_STATIC_LIB a bit odd, and I think it should be
> > > BR2_USE_STATIC_LIB instead, and compile everything statically.
> > >
> > > What do you think ?
> >
> > i agree on all points
> 
> Iirc it was me who added it and the initial intention was to only
> end up with everything static, yes.
> 
> > -mike

My old thread still lingers!  I'm about to get back to this
within the next couple of days.  The need is rising.


Andy
