From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 11:53:25 +0200
Subject: [Buildroot] [PATCH] fbgrab: bump to version 1.1
In-Reply-To: <1372898075-30947-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Wed, 3 Jul 2013 17:34:35 -0700")
References: <1372898075-30947-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87mwq2lkh6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  ...bgrab-proper-Makefile-for-cross-compiling.patch |   39 ++++++++++++++++++++
 Gilles>  package/fbgrab/fbgrab-proper_makefile.patch        |   23 ------------
 Gilles>  package/fbgrab/fbgrab.mk                           |    4 +-
 Gilles>  3 files changed, 41 insertions(+), 25 deletions(-)
 Gilles>  create mode 100644 package/fbgrab/fbgrab-proper-Makefile-for-cross-compiling.patch
 Gilles>  delete mode 100644 package/fbgrab/fbgrab-proper_makefile.patch

 Gilles> +++ b/package/fbgrab/fbgrab.mk
 Gilles> @@ -4,9 +4,9 @@
 Gilles>  #
 Gilles>  ################################################################################
 
 Gilles> -FBGRAB_VERSION = 1.0
 Gilles> +FBGRAB_VERSION = 1.1
 Gilles>  FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
 Gilles> -FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
 Gilles> +FBGRAB_SITE = http://fbgrab.monells.se

The homepage URL in Config.in should also be updated.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
