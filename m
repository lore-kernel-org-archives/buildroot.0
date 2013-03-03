From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Mar 2013 23:57:14 +0100
Subject: [Buildroot] [PATCH] aumix.mk: fix typo
In-Reply-To: <1362335872-2643-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Sun, 3 Mar 2013 19:37:52 +0100")
References: <1362335872-2643-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87ehfwt7lh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 Jerzy> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Ehh, what typo? As far as I can see from git show -w you only changed
whitespace.

 Jerzy> ---
 Jerzy>  package/multimedia/aumix/aumix.mk |    8 ++++----
 Jerzy>  1 file changed, 4 insertions(+), 4 deletions(-)

 Jerzy> diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
 Jerzy> index 534f3cf..130bda0 100644
 Jerzy> --- a/package/multimedia/aumix/aumix.mk
 Jerzy> +++ b/package/multimedia/aumix/aumix.mk
 Jerzy> @@ -4,10 +4,10 @@
 Jerzy>  #
 Jerzy>  #############################################################
 
 Jerzy> -AUMIX_VERSION=2.8
 Jerzy> -AUMIX_SOURCE=aumix-$(AUMIX_VERSION).tar.bz2
 Jerzy> -AUMIX_SITE=http://jpj.net/~trevor/aumix/releases
 Jerzy> -AUMIX_AUTORECONF=YES
 Jerzy> +AUMIX_VERSION = 2.8
 Jerzy> +AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
 Jerzy> +AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
 Jerzy> +AUMIX_AUTORECONF = YES
 
 Jerzy>  AUMIX_CONF_OPT = \
 Jerzy>  	--without-gtk \
 Jerzy> -- 
 Jerzy> 1.7.9.5

 Jerzy> _______________________________________________
 Jerzy> buildroot mailing list
 Jerzy> buildroot at busybox.net
 Jerzy> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
