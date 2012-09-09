From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Sep 2012 22:57:36 +0200
Subject: [Buildroot] [PATCH 08/10] mpfr: add license info
In-Reply-To: <1347029337-12494-8-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 11:48:55 -0300")
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87392q3oe7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/mpfr/mpfr.mk |    2 ++
 Gustavo>  1 files changed, 2 insertions(+), 0 deletions(-)

 Gustavo> diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
 Gustavo> index 9caf3ac..f283be4 100644
 Gustavo> --- a/package/mpfr/mpfr.mk
 Gustavo> +++ b/package/mpfr/mpfr.mk
 Gustavo> @@ -7,6 +7,8 @@
 Gustavo>  MPFR_VERSION = 3.1.1
 Gustavo>  MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 Gustavo>  MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
 Gustavo> +MPFR_LICENSE = GPLv3 LGPLv3+
 Gustavo> +MPFR_LICENSE_FILES = COPYING COPYING.LESSER

According to the README and mpfr website the license is simply LGPLv3+,
but I also see COPYING. Are you sure it is both?

-- 
Bye, Peter Korsgaard
