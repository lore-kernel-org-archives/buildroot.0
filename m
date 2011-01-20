From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 13:51:43 +0100
Subject: [Buildroot] [PATCH 07/10] libreplaygain: new package
In-Reply-To: <1295369680-24816-8-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:37 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lj2fbuw0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> +++ b/package/multimedia/libreplaygain/libreplaygain.mk
 Gustavo> @@ -0,0 +1,13 @@
 Gustavo> +################################################################################
 Gustavo> +#
 Gustavo> +# libreplaygain
 Gustavo> +#
 Gustavo> +################################################################################
 Gustavo> +
 Gustavo> +LIBREPLAYGAIN_VERSION =  r453
 Gustavo> +LIBREPLAYGAIN_SITE = http://files.musepack.net/source
 Gustavo> +LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 Gustavo> +LIBREPLAYGAIN_AUTORECONF = YES

Why autoreconf?

-- 
Bye, Peter Korsgaard
