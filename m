From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2019 23:40:58 +0200
Subject: [Buildroot] [PATCH: for-master 1/3] package/uclibc: remove
 UCLIBC_LARGEFILE_CONFIG
In-Reply-To: <20190817112638.11289-1-romain.naour@gmail.com>
References: <20190817112638.11289-1-romain.naour@gmail.com>
Message-ID: <cb99526d-7d82-7261-a981-b32345c215f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 13:26, Romain Naour wrote:
> UCLIBC_LARGEFILE_CONFIG was removed with the bump to uClibc-ng
> 1.0.20 (commit a44d7f2dbb19a54a8f2beb5c0f0adb0680999319)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
> ---
>  package/uclibc/uclibc.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index afc4872b65..b9ed8b9290 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -388,7 +388,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(UCLIBC_X86_TYPE_CONFIG)
>  	$(UCLIBC_DEBUG_CONFIG)
>  	$(UCLIBC_ENDIAN_CONFIG)
> -	$(UCLIBC_LARGEFILE_CONFIG)

 Since it's not defined, this is pretty harmless, so I've applied to next instead.

 Regards,
 Arnout

>  	$(UCLIBC_IPV6_CONFIG)
>  	$(UCLIBC_FLOAT_CONFIG)
>  	$(UCLIBC_SSP_CONFIG)
> 
