From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 May 2014 22:36:58 +0200
Subject: [Buildroot] [PATCH] hwdata: add license information
In-Reply-To: <1400939383-10495-1-git-send-email-abrahamh@web.de> (Heiko
 Abraham's message of "Sat, 24 May 2014 15:49:43 +0200")
References: <1400939383-10495-1-git-send-email-abrahamh@web.de>
Message-ID: <878upp8uj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Abraham <abrahamh@web.de> writes:

 > Add missing license info and file for package 'hwdata'
 > ---
 >  package/hwdata/hwdata.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
 > index 501baec..d1044c4 100644
 > --- a/package/hwdata/hwdata.mk
 > +++ b/package/hwdata/hwdata.mk
 > @@ -8,6 +8,8 @@ HWDATA_VERSION = 0.230
 >  HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 >  HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
 >  HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
 > +HWDATA_LICENSE = GPLv2 XFree86_1.0_license
 > +HWDATA_LICENSE_FILES = COPYING LICENSE

LICENSE states that it is GPLv2+. We normally use 'or' between the
licenses to clarify that you can choose and that it isn't a mix of both,
so I've added that and committed, thanks.

-- 
Bye, Peter Korsgaard
