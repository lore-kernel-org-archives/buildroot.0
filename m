From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Dec 2014 22:01:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/libdvbcsa: Update SITE url
In-Reply-To: <1419013813-2050-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Fri, 19 Dec 2014 19:30:12 +0100")
References: <1419013813-2050-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87zjaje4lr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libdvbcsa/libdvbcsa.mk |    2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
 > index ef1d957..1472537 100644
 > --- a/package/libdvbcsa/libdvbcsa.mk
 > +++ b/package/libdvbcsa/libdvbcsa.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  LIBDVBCSA_VERSION = 1.1.0
 > -LIBDVBCSA_SITE = http://download.videolan.org/pub/videolan/libdvbcsa/$(LIBDVBCSA_VERSION)
 > +LIBDVBCSA_SITE = http://get.videolan.org/libdvbcsa/$(LIBDVBCSA_VERSION)

Why?

Please document why you are doing changes in the commit messages.

-- 
Bye, Peter Korsgaard
