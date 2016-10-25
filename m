From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 19:55:29 +0200
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.0.1
In-Reply-To: <1477409262-76278-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Tue, 25 Oct 2016 17:27:42 +0200")
References: <1477409262-76278-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87vawgjotq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 > ---
 >  package/motion/motion.hash |  4 +---
 >  package/motion/motion.mk   | 10 +---------
 >  2 files changed, 2 insertions(+), 12 deletions(-)

 > diff --git a/package/motion/motion.hash b/package/motion/motion.hash
 > index 27f66b5..e859117 100644
 > --- a/package/motion/motion.hash
 > +++ b/package/motion/motion.hash
 > @@ -1,4 +1,2 @@
 >  # Locally computed:
 > -sha256	0d1702c7958fd03b99bf4fdcb45d8e604864e5867034f825f2fc543e8be64549	motion-release-3.4.1.tar.gz
 > -sha256
 > 24e7150b753da04f3477276c36ce5664453965f279196f892668063ca4d6e975
 > 709f626b7ef83a2bb3ef1f77205276207ab27196.patch
 > -sha256
 > 45ddb1599b850176a319afbcebb7f0bec309c918331da6d5fd6c3cba35387405
 > 72193ccaff83fcb074c9aaa37c5691a8d8a18c7c.patch
 > +sha256	2f67669a09ce0481ecd987028dae1c5cb135dfdc3c254c06ab7c9ca0c6c183f0	motion-release-4.0.1.tar.gz
 > diff --git a/package/motion/motion.mk b/package/motion/motion.mk
 > index 16ce406..bd9a63f 100644
 > --- a/package/motion/motion.mk
 > +++ b/package/motion/motion.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -MOTION_VERSION = release-3.4.1
 > +MOTION_VERSION = release-4.0.1
 >  MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
 >  MOTION_LICENSE = GPLv2
 >  MOTION_LICENSE_FILES = COPYING
 > @@ -12,14 +12,6 @@ MOTION_DEPENDENCIES = host-pkgconf jpeg
 >  # From git and configure.ac is patched
 >  MOTION_AUTORECONF = YES

This comment is no longer true as you removed all the patches.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
