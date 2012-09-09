From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Sep 2012 22:46:19 +0200
Subject: [Buildroot] [PATCH 05/10] gnutls: bump to 2.12.20
In-Reply-To: <1347029337-12494-5-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Sep 2012 11:48:52 -0300")
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
 <1347029337-12494-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fw6q3ox0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/gnutls/gnutls.mk |    4 +++-
 Gustavo>  1 files changed, 3 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
 Gustavo> index 1ec10b9..18e33fc 100644
 Gustavo> --- a/package/gnutls/gnutls.mk
 Gustavo> +++ b/package/gnutls/gnutls.mk
 Gustavo> @@ -4,9 +4,11 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -GNUTLS_VERSION = 2.12.19
 Gustavo> +GNUTLS_VERSION = 2.12.20
 Gustavo>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 Gustavo>  GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 Gustavo> +GNUTLS_LICENSE = GPLv3 LGPLv2.1

Same comment as less - They are both 'or later'. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
