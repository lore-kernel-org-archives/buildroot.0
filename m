From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 17:00:43 +0200
Subject: [Buildroot] [PATCH] libsoc: bump to version 0.8.2
In-Reply-To: <1466603826-24018-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 22 Jun 2016 15:57:06
 +0200")
References: <1466603826-24018-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87inx1w9no.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/libsoc/libsoc.hash | 4 ++--
 >  package/libsoc/libsoc.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/libsoc/libsoc.hash b/package/libsoc/libsoc.hash
 > index e6a8577..77f2fad 100644
 > --- a/package/libsoc/libsoc.hash
 > +++ b/package/libsoc/libsoc.hash
 > @@ -1,2 +1,2 @@
 > -# Locally calculated
 > -sha256  fc7f4c4ec5cc694833f27d91603aaaa6a43e8100ab26bac47f553753c8d45ac0  libsoc-0.7.1.tar.gz
 > +# Locally computed:
 > +sha256  8df626bde365b94a805e1c323104c63a7429ec64c9df815cd1d9b9c4b317e066  libsoc-0.8.2.tar.gz
 > diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
 > index 84e281f..ba20ed3 100644
 > --- a/package/libsoc/libsoc.mk
 > +++ b/package/libsoc/libsoc.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBSOC_VERSION = 0.7.1
 > +LIBSOC_VERSION = 0.8.2
 >  LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 >  LIBSOC_LICENSE = LGPLv2.1
 >  LIBSOC_LICENSE_FILES = COPYING

It seems something happened with the license:

cat: /home/peko/source/buildroot/output/build/libsoc-0.8.2/COPYING: No such file or directory
package/libsoc/libsoc.mk:14: recipe for target 'libsoc-legal-info' failed

Please fix and resubmit, thanks.

-- 
Bye, Peter Korsgaard
