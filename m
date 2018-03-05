From: daggs <daggs@gmx.com>
Date: Mon, 5 Mar 2018 22:31:15 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add odroidc2 defconfig to my
 list
In-Reply-To: <20180305205227.0ea0835d@windsurf.home>
References: <20180305174323.5629-1-daggs@gmx.com>
 <20180305205227.0ea0835d@windsurf.home>
Message-ID: <trinity-8eeb8bbb-57aa-466c-9fda-3ea3062e2728-1520285475317@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Hello,
> 
> On Mon,  5 Mar 2018 19:43:23 +0200, Dagg Stompler wrote:
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  DEVELOPERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 73c0231bc0..fffc646973 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -458,6 +458,7 @@ N:	Dagg Stompler <daggs@gmx.com>
> >  F:	package/libamcodec/
> >  F:	package/odroid-mali/
> >  F:	package/odroid-scripts/
> > +F:	configs/odroidc2_defconfig
> 
> Thanks! However, alphabetic ordering is not respected here, and you
> should also add an entry for board/hardkernel/odroidc2/.
> 
> This can be fixed when we apply, unless you want to send a v2 for
> this :)
> 
> Thanks!
> 
> Thomas

you can fix it when applying, that's how I'll know what to do in V4 of the mainline support (forgot to add the dev entries)

Dagg.
