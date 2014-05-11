From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 May 2014 08:58:05 -0300
Subject: [Buildroot] [PATCH 1/2] powerpc64 powerpc64le: add support
In-Reply-To: <1399796286-14822-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399796286-14822-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <536F65CD.4070901@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/2014 05:18 AM, Cody P Schafer wrote:

>  config BR2_generic_powerpc
>  	bool "generic"
> +	select BR2_POWERPC_CPU_HAS_ALTIVEC if BR2_ARCH_IS_64

> +config BR2_powerpc_power4
> +	bool "power4"
> +config BR2_powerpc_power5
> +	bool "power5"

Generic has altivec and power4/5 don't?
That doesn't sound right, generic should be the lowest common denominator...
Regards.
