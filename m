From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 14:11:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libebur128: bump version to
	1.2.2, add hash
In-Reply-To: <20170918175333.11235-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 18 Sep 2017 19:53:33 +0200")
References: <20170918175333.11235-1-bernd.kuhls@t-online.de>
Message-ID: <87wp4u28ix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libebur128/libebur128.hash | 3 +++
 >  package/libebur128/libebur128.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 1 deletion(-)
 >  create mode 100644 package/libebur128/libebur128.hash

 > diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
 > new file mode 100644
 > index 0000000000..2b0d3e34c2
 > --- /dev/null
 > +++ b/package/libebur128/libebur128.hash
 > @@ -0,0 +1,3 @@
 > +# Locally computed
 > +sha256 1d0d7e855da04010a2432e11fbc596502caf11b61c3b571ccbcb10095fe44b43  libebur128-v1.2.2.tar.gz
 > +sha256 d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
 > diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
 > index f5ada311f7..0302b5bd89 100644
 > --- a/package/libebur128/libebur128.mk
 > +++ b/package/libebur128/libebur128.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBEBUR128_VERSION = v1.1.0
 > +LIBEBUR128_VERSION = v1.2.2

A quick look at the release notes:

https://github.com/jiixyj/libebur128/releases

Shows:

New FIR resampler for true peak calculation, removing Speex dependency

So is speex still needed?

-- 
Bye, Peter Korsgaard
