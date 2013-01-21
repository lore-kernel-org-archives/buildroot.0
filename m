From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:43:05 +0100
Subject: [Buildroot] [PATCH 02/10] coreutils: add license information
In-Reply-To: <1358803790-30245-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 Jan 2013 18:29:42 -0300")
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
 <1358803790-30245-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2wy88ee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/coreutils/coreutils.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
 Gustavo> index d7d0779..4fc70f7 100644
 Gustavo> --- a/package/coreutils/coreutils.mk
 Gustavo> +++ b/package/coreutils/coreutils.mk
 Gustavo> @@ -7,6 +7,8 @@
 Gustavo>  COREUTILS_VERSION = 8.18
 Gustavo>  COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 Gustavo>  COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 Gustavo> +COREUTILS_LICENSE = GPLv3
 Gustavo> +COREUTILS_LICENSE_FILES = COPYING

It seems to be GPLv3+:

 grep -rls 'later version' *|wc -l
1656

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
