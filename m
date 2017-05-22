From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 22:15:31 +0200
Subject: [Buildroot] [PATCH/next] package/bustle: bump version to 0.5.4
In-Reply-To: <20170521182838.2161-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 21 May 2017 20:28:38 +0200")
References: <20170521182838.2161-1-bernd.kuhls@t-online.de>
Message-ID: <87h90czlzw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/bustle/bustle.hash | 2 +-
 >  package/bustle/bustle.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/bustle/bustle.hash b/package/bustle/bustle.hash
 > index 9c6df5671..49890f74f 100644
 > --- a/package/bustle/bustle.hash
 > +++ b/package/bustle/bustle.hash
 > @@ -1,2 +1,2 @@
 >  # Locally calculated
 > -sha256	6c76cb5182c20b8ce7d6911f8aebc4fae43f919e747a003f1a66698628b27682  bustle-0.4.3.tar.gz
 > +sha256 921c2cbbb957dcb02c3aa8fd1eeff3534cb437fa9eeca1c25206ad1e741a3f14  bustle-0.5.4.tar.gz
 > diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
 > index 4cd446065..ffbfbe40f 100644
 > --- a/package/bustle/bustle.mk
 > +++ b/package/bustle/bustle.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -BUSTLE_VERSION = 0.4.3
 > +BUSTLE_VERSION = 0.5.4
 >  BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)

While this still works, it seems bustle has moved to freedesktop - So it
would be good to change the homepage link to:

https://wiki.freedesktop.org/www/Software/Bustle/

And the download link to:

https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)

-- 
Bye, Peter Korsgaard
