From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Jan 2011 09:52:47 -0300
Subject: [Buildroot] [PATCH 07/10] libreplaygain: new package
In-Reply-To: <87lj2fbuw0.fsf@macbook.be.48ers.dk>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>	<1295369680-24816-8-git-send-email-gustavo@zacarias.com.ar>
	<87lj2fbuw0.fsf@macbook.be.48ers.dk>
Message-ID: <4D38301F.5000406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/11 09:51, Peter Korsgaard wrote:

>  Gustavo> +++ b/package/multimedia/libreplaygain/libreplaygain.mk
>  Gustavo> @@ -0,0 +1,13 @@
>  Gustavo> +################################################################################
>  Gustavo> +#
>  Gustavo> +# libreplaygain
>  Gustavo> +#
>  Gustavo> +################################################################################
>  Gustavo> +
>  Gustavo> +LIBREPLAYGAIN_VERSION =  r453
>  Gustavo> +LIBREPLAYGAIN_SITE = http://files.musepack.net/source
>  Gustavo> +LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
>  Gustavo> +LIBREPLAYGAIN_AUTORECONF = YES
> 
> Why autoreconf?

Why don't they ship configure? :-)
