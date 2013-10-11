From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 23:21:42 +0200
Subject: [Buildroot] [PATCH] uboot: support -r option for mkenvimage
In-Reply-To: <52586B38.6010306@mind.be>
References: <1381478269-29943-1-git-send-email-spdawson@gmail.com>
 <52586B38.6010306@mind.be>
Message-ID: <20131011232142.2dc7fb7a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 11 Oct 2013 23:18:48 +0200, Arnout Vandecappelle wrote:

> > +config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
> > +	bool "Redundant environment"
> 
>   "Redundant environment" sounds as if it's... redundant :-)
> 
>   How about "Environment has two copies"?

I would also mention in the help text that it's related to the usage of
the CONFIG_ENV_ADDR_REDUND / CONFIG_ENV_SIZE_REDUND options of U-Boot,
so that the user can more easily match that with the U-Boot
configuration for his platform.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
