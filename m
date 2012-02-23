From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 23 Feb 2012 16:39:12 +0100
Subject: [Buildroot] Craneborad and Buildroot
In-Reply-To: <CABMxt4gbvhDEkY315AVrRqyqQx1gE3=P3PaZ0Wcnj74J=ieJFQ@mail.gmail.com>
References: <CABMxt4gbvhDEkY315AVrRqyqQx1gE3=P3PaZ0Wcnj74J=ieJFQ@mail.gmail.com>
Message-ID: <4F465DA0.7040407@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 23.02.2012 16:36, schrieb Mohamed HAMZAOUI:
> Hi,
> 
> I want to use Buildroot for CraneBoard...
> 
> My problem is with configuration files : MLO, u-boot.bin and uImage.
> I installed the last RC buildroot and after I started to configure the build by selecting the desired setting because i dont found a defconfig file for Kernel with buildroot ...
> 
> In the configuration of the bootloader I checked xloader and uboot. With uboot I found a configuration file to my card "am3517_crane" but, for xloader, I haven't found anything and I cannot generate the correspendant MLO .
> 
> I copy MLO, which was provided for Angstrom distrib for my card (compiled whith openembedded) but I cannot load the u-boot. suddenly, I also tried copying uboot that provided with the same distrib of  MLO and then I start but I am blocked on: "booting the kernel"!
> 
> Could you tell me why i have this freeze ?
> Could you tell me what I do with buildroot to find the xloader configuration file to my card ?

What toolchain are you using? Try ct-ng. I have reported the problems with CodeSourcery and native toolchains recently. 

Best regards,
Yegor
