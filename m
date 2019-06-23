From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 09:39:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/davfs2: bump to version 1.5.5
In-Reply-To: <20190619214926.26685-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 19 Jun 2019 23:49:26 +0200")
References: <20190619214926.26685-1-fontaine.fabrice@gmail.com>
Message-ID: <87fto0g38k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/davfs2/davfs2.hash | 2 +-
 >  package/davfs2/davfs2.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
 > index 102659a38d..7e2078bec5 100644
 > --- a/package/davfs2/davfs2.hash
 > +++ b/package/davfs2/davfs2.hash
 > @@ -1,4 +1,4 @@
 >  # Locally calculated
 > -sha256 c9c4e0f0912a782386216b2147eb9c36c47f193b8fcf3d637719e0b9fe7c96e0  davfs2-1.5.4.tar.gz
 > +sha256 587c6a25ad78109995a7ccb8e60aa1c491b149f2c99d47033f3d5e648430ad2f  davfs2-1.5.5.tar.gz
 >  # License file, locally calculated
 >  sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
 > diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
 > index f2b2fdbe41..90f73f4df0 100644
 > --- a/package/davfs2/davfs2.mk
 > +++ b/package/davfs2/davfs2.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -DAVFS2_VERSION = 1.5.4
 > +DAVFS2_VERSION = 1.5.5

Would this be suitable for 2019.02.x?

-- 
Bye, Peter Korsgaard
