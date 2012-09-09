From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Sep 2012 22:59:33 +0200
Subject: [Buildroot] [PATCH 09/10] gmp: add license info
In-Reply-To: <1347029337-12494-9-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 11:48:56 -0300")
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5ki29qi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/gmp/gmp.mk |    2 ++
 Gustavo>  1 files changed, 2 insertions(+), 0 deletions(-)

 Gustavo> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
 Gustavo> index 5bcc6c1..c0a74f0 100644
 Gustavo> --- a/package/gmp/gmp.mk
 Gustavo> +++ b/package/gmp/gmp.mk
 Gustavo> @@ -7,6 +7,8 @@
 Gustavo>  GMP_VERSION = 5.0.5
 Gustavo>  GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 Gustavo>  GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 Gustavo> +GMP_LICENSE = GPLv3 LGPLv3
 Gustavo> +GMP_LICENSE_FILES = COPYING COPYING.LIB

Same comment as for mpfr.

-- 
Bye, Peter Korsgaard
