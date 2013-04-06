From: Ormund Williams <ormundw@panix.com>
Date: Sat, 06 Apr 2013 14:05:09 -0400
Subject: [Buildroot] Trying to configure the kernel
In-Reply-To: <20130406152619.7d3f29c1@skate>
References: <1365192366.30488.205.camel@station1.ormlab.com>
 <20130406152619.7d3f29c1@skate>
Message-ID: <1365271509.30488.259.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2013-04-06 at 15:26 +0200, Thomas Petazzoni wrote:
> Well, I thought the messages were clear enough, but it seems they are
> not.
> 
>  * If you chose to use a defconfig, then you must give the name of a
>    defconfig file, using the BR2_LINUX_KERNEL_DEFCONFIG option.
> 
>  * If you chose to use a kernel configuration file, then you must give
>    the path to this file in BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE.
> 
> In short, there is no way to just "start the kernel configuration", you
> must first give it an initial existing configuration. Maybe we should
> add an option "Just run the kernel configuration with whatever defaults
> for the current architecture", so that you don't have to give an
> existing defconfig or an existing kernel configuration file.
> 
A default would be great but just adding the above paragraph to section
3.3.4 of the manual would be helpful.

> What architecture and hardware are you targeting? If you're targeting
> x86, then you can set BR2_LINUX_KERNEL_DEFCONFIG to 'i386', if you're
> targeting x86-64, then you can set BR2_LINUX_KERNEL_DEFCONFIG to
> 'x86_64'. If you're targeting ARM, then you should look in the kernel
> sources which defconfig in arch/arm/configs/ matches your hardware.
> 
An ARM board that I'm currently designing.  I wanted to explore a
complete system and the make files used to build it.

Regards,


-- 
Ormund
