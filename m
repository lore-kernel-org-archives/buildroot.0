From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 28 Jan 2009 07:48:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/elf2flt
In-Reply-To: <20090128063240.3211E769CC@busybox.osuosl.org>
References: <20090128063240.3211E769CC@busybox.osuosl.org>
Message-ID: <20090128074825.3ae94d3b@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Jan 2009 06:32:40 +0000 (UTC)
jacmet at uclibc.org wrote:

<snipp>

> --- trunk/buildroot/Config.in	2009-01-28 06:32:33 UTC (rev
> 25085) +++ trunk/buildroot/Config.in	2009-01-28 06:32:39 UTC
> (rev 25086) @@ -243,14 +243,14 @@
>  
>  config BR2_STRIP_strip
>  	bool "strip"
> -	depends on !BR2_ENABLE_DEBUG
> +	depends on !BR2_ENABLE_DEBUG &&  !BR2_ELF2FLT

                      extra whitespace ^^

-- 
Best regards,
Hans-Christian Egtvedt
