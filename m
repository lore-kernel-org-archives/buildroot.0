From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Dec 2012 17:45:45 +0100
Subject: [Buildroot] [PATCH 14/14] ltrace: bump to version 0.7.1
In-Reply-To: <1354545972-26783-14-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
 <1354545972-26783-14-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20121203174545.475969fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  3 Dec 2012 11:46:12 -0300, Gustavo Zacarias wrote:

>  config BR2_PACKAGE_LTRACE
>  	bool "ltrace"
> -	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64)
> -	depends on !BR2_xtensa
> +	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa)
>  	select BR2_PACKAGE_LIBELF

So now ltrace supports mipsel ?

When there are more changes than just bumping the version name, like
changes in patches and other things, it'd be nice to have a slightly
more elaborate commit log.

And, unrelated to the commit itself, did you try this ltrace version? I
have never been able to get ltrace 0.6 to work on ARM/uClibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
