From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 10:36:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.6.4
In-Reply-To: <20210112221149.1557387-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 12 Jan 2021 23:11:49 +0100")
References: <20210112221149.1557387-1-joerg.krause@embedded.rocks>
Message-ID: <8735z5gov9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 >  package/gerbera/gerbera.hash | 2 +-
 >  package/gerbera/gerbera.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
 > index 0ade0fd3af..e584db1354 100644
 > --- a/package/gerbera/gerbera.hash
 > +++ b/package/gerbera/gerbera.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed:
 > -sha256  3a4956ec5fea1101e8daa32d9cfb985db908a49e2ac6137a1b2bf509e2684a6c  gerbera-1.6.0.tar.gz
 > +sha256  cbe7ea78977db8c02fcca1759ed149f199a590afaf4a6d21ffcca8623d1a0cc5  gerbera-1.6.4.tar.gz
 >  sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
 > diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
 > index 3dc8f0328c..2d3ea37fe0 100644
 > --- a/package/gerbera/gerbera.mk
 > +++ b/package/gerbera/gerbera.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -GERBERA_VERSION = 1.6.0
 > +GERBERA_VERSION = 1.6.4

Hmm, what is this against? git master has 1.4.0.

-- 
Bye, Peter Korsgaard
