From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 10:07:34 +0200
Subject: [Buildroot] [PATCH] package/procps-ng: bump to version 3.3.12
In-Reply-To: <CANCHnQoskWPV9j8W3ksuHa9SXNdWPtti3+-6FtQrX0F=EsRtxA@mail.gmail.com>
 (Jeroen Roovers's message of "Wed, 31 Aug 2016 08:05:19 +0200")
References: <CANCHnQoskWPV9j8W3ksuHa9SXNdWPtti3+-6FtQrX0F=EsRtxA@mail.gmail.com>
Message-ID: <87r395z7i1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeroen" == Jeroen Roovers <jer@airfi.aero> writes:

 > package/procps-ng: Version 3.3.12
 > Signed-off-by: Jeroen Roovers <jer@airfi.aero>
 > diff --git a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
 > b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
 > index c25da3b..1329ac4 100644
 > --- a/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
 > +++ b/package/procps-ng/0002-use-pkgconfig-for-ncursesw-cflags.patch
 > @@ -35,7 +35,7 @@ diff -Nura procps-ng-3.3.10.orig/Makefile.am

Thanks, but your patch is badly wordwrapped. Can you please resend with
git send-email?

For details, see:
https://buildroot.org/downloads/manual/manual.html#submitting-patches

-- 
Bye, Peter Korsgaard
