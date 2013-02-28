From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Feb 2013 21:00:15 -0300
Subject: [Buildroot] [PATCH 01/30] pcre: add support for 16 bits and 32
 bits variants
In-Reply-To: <1362007582-14753-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362007582-14753-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <512E9E0F.9080208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/2013 08:25 PM, Thomas Petazzoni wrote:
> backward compatibility, the 8bits variant is automatically chosen is

s/is/if/ (2nd)

> +config BR2_PACKAGE_PCRE_8
> +	bool "8-bit pcre"
> +	help
> +	  This option builds the 8-bit pcre library, i.e 'libpcre'
> +
> +config BR2_PACKAGE_PCRE_16
> +	bool "16-bit pcre"
> +	help
> +	  This option builds the 8-bit pcre library, i.e 'libpcre16'
> +
> +config BR2_PACKAGE_PCRE_32
> +	bool "32-bit pcre"
> +	help
> +	  This option builds the 8-bit pcre library, i.e 'libpcre32'
> +
> +endif

They're all 8 bits even if they're 16 or 32? :)
Otherwise looking good.
Regards.
