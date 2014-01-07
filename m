From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Jan 2014 21:34:07 +0100
Subject: [Buildroot] [PATCH] udev : mention dependancy on inotify
In-Reply-To: <1389091869-13609-1-git-send-email-jeremy.rosen@openwide.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s message of "Tue, 7 Jan 2014 11:51:09
 +0100")
References: <1389091869-13609-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <87ha9fwmyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@openwide.fr> writes:

 > Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
 > ---
 >  package/udev/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/udev/Config.in b/package/udev/Config.in
 > index 91dc7cf..d915d24 100644
 > --- a/package/udev/Config.in
 > +++ b/package/udev/Config.in
 > @@ -11,7 +11,7 @@ config BR2_PACKAGE_UDEV
 >  	help
 >  	  Userspace device daemon.
 
 > -	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
 > +	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs and inotify.

Committed with the help text wrapped so it displays without scrolling,
thanks.

-- 
Bye, Peter Korsgaard
