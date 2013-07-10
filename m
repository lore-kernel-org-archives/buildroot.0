From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 22:08:04 +0200
Subject: [Buildroot] [PATCH 03/11] libelf: define license
In-Reply-To: <1373477150-10251-3-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Wed, 10 Jul 2013 10:25:42 -0700")
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
 <1373477150-10251-3-git-send-email-gilles.talis@gmail.com>
Message-ID: <87hag2faaj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/libelf/libelf.mk |    2 ++
 Gilles>  1 files changed, 2 insertions(+), 0 deletions(-)

 Gilles> diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
 Gilles> index 725035f..c1befc8 100644
 Gilles> --- a/package/libelf/libelf.mk
 Gilles> +++ b/package/libelf/libelf.mk
 Gilles> @@ -10,6 +10,8 @@ LIBELF_SITE=http://www.mr511.de/software/
 Gilles>  LIBELF_INSTALL_STAGING = YES
 Gilles>  LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 Gilles>  LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
 Gilles> +LIBELF_LICENSE = GPLv2+
 Gilles> +LIBELF_LICENSE_FILES = COPYING.LIB

COPYING.LIB is LGPL, so it should be LGPLv2+

-- 
Bye, Peter Korsgaard
