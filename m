From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:21:34 +0200
Subject: [Buildroot] [PATCH] augeas: security bump to version 1.8.1
In-Reply-To: <20170920130931.11725-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 20 Sep 2017 15:09:31 +0200")
References: <20170920130931.11725-1-joerg.krause@embedded.rocks>
Message-ID: <878th9z3oh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Fixes CVE-2017-7555.

Committed after extending the commit message with the text of the CVE,
thanks.

> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 >  package/augeas/augeas.hash | 2 +-
 >  package/augeas/augeas.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
 > index 797bddbb6b..e044ff42a7 100644
 > --- a/package/augeas/augeas.hash
 > +++ b/package/augeas/augeas.hash
 > @@ -1,2 +1,2 @@
 >  # Locally calculated
 > -sha256  515ce904138d99ff51d45ba7ed0d809bdee6c42d3bc538c8c820e010392d4cc5  augeas-1.8.0.tar.gz
 > +sha256  65cf75b5a573fee2a5c6c6e3c95cad05f0101e70d3f9db10d53f6cc5b11bc9f9  augeas-1.8.1.tar.gz
 > diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
 > index 1c1461e369..20d09eb390 100644
 > --- a/package/augeas/augeas.mk
 > +++ b/package/augeas/augeas.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -AUGEAS_VERSION = 1.8.0
 > +AUGEAS_VERSION = 1.8.1
 >  AUGEAS_SITE = http://download.augeas.net
 >  AUGEAS_INSTALL_STAGING = YES
 >  AUGEAS_LICENSE = LGPL-2.1+
 > -- 
 > 2.14.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
