From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Oct 2014 08:40:49 +0200
Subject: [Buildroot] [PATCH 4/5] libgeotiff: add license informations
In-Reply-To: <1412871048-28981-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 9 Oct 2014 18:10:47 +0200")
References: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1412871048-28981-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvewa0lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > It would be good to get some independent review of the license
 > information, since it's not really clear how to encode the license
 > details provided in the LICENSE file into the LIBGEOTIFF_LICENSE
 > variable.

Yeah, I agree that it is a bit of a mess.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/libgeotiff/libgeotiff.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
 > index 61f5c21..2bb0941 100644
 > --- a/package/libgeotiff/libgeotiff.mk
 > +++ b/package/libgeotiff/libgeotiff.mk
 > @@ -6,6 +6,8 @@
 
 >  LIBGEOTIFF_VERSION = 1.4.0
 >  LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 > +LIBGEOTIFF_LICENSE = X-style, public domain

I know that is what the license explicitly says, but the X refers to
X11, and we use X11 elsewhere so I've changed it to X11-style.

Committed, thanks.

-- 
Bye, Peter Korsgaard
