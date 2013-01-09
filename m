From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 23:39:17 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: be more explicit in
 the config file help
In-Reply-To: <1357770170-30858-1-git-send-email-yann.morin.1998@free.fr>
References: <1357770170-30858-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130109233917.73776253@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  9 Jan 2013 23:22:50 +0100, Yann E. MORIN wrote:

>  	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc"  if BR2_TOOLCHAIN_CTNG_glibc
>  	help
>  	  Enter here the crosstool-NG's .config file to use.

Enter here the path to the crosstool-NG .config file to use.

> -	  To fine-tune your toolchain, you can also call:
> +	  To fine-tune your toolchain, you may also run (from the
> +	  command line) this command:
>  	    make ctng-menuconfig
>  
>  	  If unsure, keep the default value.

I would insist a bit more here, something along the lines of:

 "Generally, the default crosstool-NG configuration files bundled with
 Buildroot work fine in most situations. Use 'make ctng-menuconfig'
 only for expert customization of your toolchain".

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
