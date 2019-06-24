From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 22:07:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: bump version to 3.2.8
In-Reply-To: <20190622175953.12449-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 22 Jun 2019 19:59:53 +0200")
References: <20190622175953.12449-1-bernd.kuhls@t-online.de>
Message-ID: <87v9wukarm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/eudev/eudev.hash | 4 ++--
 >  package/eudev/eudev.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
 > index 33556a2d25..d1541d0c82 100644
 > --- a/package/eudev/eudev.hash
 > +++ b/package/eudev/eudev.hash
 > @@ -1,5 +1,5 @@
 >  # From http://dev.gentoo.org/~blueness/eudev/
 > -md5 c75d99910c1791dd9430d26ab76059c0  eudev-3.2.7.tar.gz
 > +md5 ce166b3fdd910c2a4a840378f48fedaf  eudev-3.2.8.tar.gz
 >  # Locally calculated
 > -sha256 3004614bd253c1f98558460215027aaf60d7592c70be27fd384ec01db87bf062  eudev-3.2.7.tar.gz
 > +sha256 61e4948e9e51271c3cce2bb5311a30b206dd03ef011062e6c627fb007e43f6b8  eudev-3.2.8.tar.gz
 >  sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 > diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
 > index d88e010c28..78d0ea670e 100644
 > --- a/package/eudev/eudev.mk
 > +++ b/package/eudev/eudev.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -EUDEV_VERSION = 3.2.7
 > +EUDEV_VERSION = 3.2.8

I had a look at the changed between 3.2.7 and 3.2.8 for 2019.02.x, and I
noticed that our patch 2 and 3 are included in 3.2.8:

https://github.com/gentoo/eudev/commits/master

Care to send a patch to drop local patches?

-- 
Bye, Peter Korsgaard
