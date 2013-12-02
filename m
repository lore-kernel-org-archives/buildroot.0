From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 09:53:32 +0100
Subject: [Buildroot] [PATCH 1/2] package: unification of name
 <pkg>_VERSION_MAJOR variable
In-Reply-To: <20131202095237.0241c919@skate>
References: <1385971203-11645-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20131202095237.0241c919@skate>
Message-ID: <20131202095332.47b85913@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy,

On Mon, 2 Dec 2013 09:52:37 +0100, Thomas Petazzoni wrote:
> Dear Jerzy Grzegorek,
> 
> On Mon,  2 Dec 2013 09:00:02 +0100, Jerzy Grzegorek wrote:
> 
> > -JSON_GLIB_VERSION = $(JSON_GLIB_MAJOR_VERSION).$(JSON_GLIB_MINOR_VERSION)
> > -JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_MAJOR_VERSION)
> > +JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).$(JSON_GLIB_MINOR_VERSION)
> 
> So we have VERSION_MAJOR and then MINOR_VERSION ? Doesn't seem really
> consistent.

Ok, ignore that comment, sorry. I did review PATCH 1/2, and only after
that I saw PATCH 2/2. So just ignore my stupidity :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
