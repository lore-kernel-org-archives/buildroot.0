From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 21:14:10 +0200
Subject: [Buildroot] [PATCH 10/21] package/snappy: bump version
In-Reply-To: <baf017295cfab2600216c057e3a75a25a2b7f8c1.1401658972.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:43:41 +0200")
References: <cover.1401658972.git.yann.morin.1998@free.fr>
 <baf017295cfab2600216c057e3a75a25a2b7f8c1.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <87d2erw2d9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > This is the un-tagged 1.1.2 release.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/snappy/snappy.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
 > index c30cb3c..6d20df8 100644
 > --- a/package/snappy/snappy.mk
 > +++ b/package/snappy/snappy.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -SNAPPY_VERSION = 1.1.1
 > -SNAPPY_SITE = http://snappy.googlecode.com/files/
 > +SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
 > +SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))

Seems like it is missing an AUTORECONF:

http://autobuild.buildroot.net/results/0ec/0ec62efed0e0aec56b4aa6b5ef1a3bcbd1474949/build-end.log

Will fix now.

-- 
Bye, Peter Korsgaard
