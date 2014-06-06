From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Jun 2014 12:59:51 +0200
Subject: [Buildroot] [PATCH 06/26] package/tzdata: bump version for some
	new timezones
In-Reply-To: <65531c070eb1214153e3a95b1bf837898af67448.1401656581.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:03:30 +0200")
References: <cover.1401656581.git.yann.morin.1998@free.fr>
 <65531c070eb1214153e3a95b1bf837898af67448.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <87ha3ymhg8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > A few adjustments here and there, plus re-definition
 > of the Crimea timezone.

 > New definition for the moment the Big-Bang occured, too. :-)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

While reading lwn.net, I noticed this:

https://bugzilla.gnome.org/show_bug.cgi?id=730332

Have you noticed isses with glib-based programs? Do we need to patch
glib?

 > ---
 >  package/tzdata/tzdata.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
 > index 58b5f13..4f86289 100644
 > --- a/package/tzdata/tzdata.mk
 > +++ b/package/tzdata/tzdata.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -TZDATA_VERSION = 2014a
 > +TZDATA_VERSION = 2014d
 >  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 >  TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 >  TZDATA_DEPENDENCIES = host-zic
 > -- 
 > 1.8.3.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
