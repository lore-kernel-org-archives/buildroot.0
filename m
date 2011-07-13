From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 21:03:51 +0200
Subject: [Buildroot] [PATCH] shared-mime-info: update to version 0.90
In-Reply-To: <20110713190958.05f00698@skate>
References: <1310575692-8877-1-git-send-email-s.neumann@raumfeld.com>
 <20110713190958.05f00698@skate>
Message-ID: <1310583832.11691.3.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-07-13 at 19:09 +0200, Thomas Petazzoni wrote:
> Le Wed, 13 Jul 2011 18:48:12 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> >  .../shared-mime-info-0.60-fix-xmllint.patch        |   17 -----------------
> 
> Patch mainlined ?

Yes, this has been fixed in mainline.

> >  SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
> > +SHARED_MIME_INFO_MAKE_OPT = -j1
> >  
> >  HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
> >  
> > -HOST_SHARED_MIME_INFO_CONF_OPT = \
> > -	--disable-update-mimedb
> > +HOST_SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
> > +HOST_SHARED_MIME_INFO_MAKE_OPT = -j1
> 
> 
> Usually, we do :
> 
> <pkg>_MAKE = $(MAKE1)

Ah, I see. I'll submit an updated patch then unless someone beats me to
it...


Sven
