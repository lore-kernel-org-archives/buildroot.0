From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Oct 2013 12:31:10 +0200
Subject: [Buildroot] [PATCH] libfreefare: new repository
In-Reply-To: <1382605205-7965-1-git-send-email-arnaud.aujon@gmail.com> (Arnaud
 Aujon's message of "Thu, 24 Oct 2013 11:00:05 +0200")
References: <1382605205-7965-1-git-send-email-arnaud.aujon@gmail.com>
Message-ID: <874n8563rl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnaud" == Arnaud Aujon <arnaud.aujon@gmail.com> writes:

 > Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
 > ---
 >  package/libfreefare/libfreefare.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
 > index 859b5e3..8dcd6b8 100644
 > --- a/package/libfreefare/libfreefare.mk
 > +++ b/package/libfreefare/libfreefare.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  LIBFREEFARE_VERSION = 0.3.4
 > -LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
 > +LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
 >  LIBFREEFARE_DEPENDENCIES = libnfc openssl

We should also adjust the upstream URL in Config.in, as the old one no
longer works. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
