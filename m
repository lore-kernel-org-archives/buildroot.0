From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libhid: update the upstream URL
 in Config.in
In-Reply-To: <20191128122852.31052-1-mark@dibsco.co.uk> (Mark Corbin's message
 of "Thu, 28 Nov 2019 12:28:52 +0000")
References: <20191128122852.31052-1-mark@dibsco.co.uk>
Message-ID: <87h82ndpaa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark@dibsco.co.uk> writes:

 > Update the upstream URL in the help text in Config.in. This
 > addresses the 'Invalid(Err)' URL status in the package stats
 > web page output.

 > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
 > ---
 >  package/libhid/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/libhid/Config.in b/package/libhid/Config.in
 > index e6f2012860..ec66308061 100644
 > --- a/package/libhid/Config.in
 > +++ b/package/libhid/Config.in
 > @@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBHID
 >  	help
 >  	  Userspace library for accessing USB HID devices
 
 > -	  http://libhid.alioth.debian.org
 > +	  https://directory.fsf.org/wiki/Libhid

Same story as for mii-diag, removed from Debian in 2010:

https://tracker.debian.org/news/627415/bug496665-removed-packages-from-unstable/

So we should probably get rid of it as well.

But in the mean time I have committed this patch, thanks.

-- 
Bye, Peter Korsgaard
