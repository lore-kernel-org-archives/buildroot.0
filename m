From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Thu, 19 Sep 2013 08:31:00 +0300
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
In-Reply-To: <20130919062450.10f51848@skate>
References: <201309182118.23091.fatih.asici@gmail.com>
 <20130919062450.10f51848@skate>
Message-ID: <1379568660.27759.4.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2013-09-19 at 06:24 +0200, Thomas Petazzoni wrote:
> > > > -@@ -0,0 +1,43 @@
> > > > +@@ -0,0 +1,44 @@
> > > > 
> > > >  +MAKEFILE_GENERATOR      = UNIX
> > > > 
> > > > -+CONFIG                  += incremental gdb_dwarf_index
> > > > ++CONFIG                 += incremental gdb_dwarf_index
> > > 
> > > Is this change needed? Seems like white space change only, no?
> > 
> > I checked the mkspec files in old and new versions of upstream.
> Upstream's
> > files have this change. So I changed our mkspec file to reduce diff
> output.
> > I think, this will help checking again in new versions. Yes, it is
> only
> > a white space change and not needed.
> 
> It's a bit early, so maybe my brain is not yet up and running, but if
> the upstream has changed this, and we don't care about whether there's
> a space or not, why does our patch contains something to change this?

It is just a cosmetic change not to see the difference when comparing
files :)

If the rule is not to touch anywhere unrelated to the version change, I
can revert that part.
