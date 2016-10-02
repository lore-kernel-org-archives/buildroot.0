From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 21:31:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/snappy: bump version
In-Reply-To: <1475348688-1805-2-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 1 Oct 2016 21:04:48 +0200")
References: <1475348688-1805-1-git-send-email-yann.morin.1998@free.fr>
 <1475348688-1805-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87eg3ypmy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

For these bump-to-another-git-revision changes I would prefer some
context / details. For bumps to a new release we at least know that the
maintainer thinks the sw is ready to be used. With random git versions
not so much.

E.G. has some important bugfix or new feature been added? Have you used
it yourself? Is the new hash the latest commit in the repo or something
else? ..

Anyway - Committed, thanks.

> ---
 >  package/snappy/snappy.hash | 2 +-
 >  package/snappy/snappy.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
 > index fc979ae..bb7f104 100644
 > --- a/package/snappy/snappy.hash
 > +++ b/package/snappy/snappy.hash
 > @@ -1,2 +1,2 @@
 >  # Locally calculated
 > -sha256
 > d64e434e2ddfe9ae942708747003d489e27f2bfddaa5e9e070da98cb00f660f2
 > snappy-1ff9be9b8fafc8528ca9e055646f5932aa5db9c4.tar.gz
 > +sha256
 > f50719c6dc7103d65df66882a3b4569d598eda251266463eca716928187dc12b
 > snappy-32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda.tar.gz
 > diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
 > index 3e8d603..f491f03 100644
 > --- a/package/snappy/snappy.mk
 > +++ b/package/snappy/snappy.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
 > +SNAPPY_VERSION = 32d6d7d8a2ef328a2ee1dd40f072e21f4983ebda
 >  SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 >  SNAPPY_LICENSE = BSD-3c
 >  SNAPPY_LICENSE_FILES = COPYING
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
