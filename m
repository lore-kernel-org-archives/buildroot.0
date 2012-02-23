From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Thu, 23 Feb 2012 16:30:25 +0100
Subject: [Buildroot] [buildroot]craneborad and buildroot
In-Reply-To: <CABMxt4i6k7YMg79fwmxAJ6wW61g9ygyuOOGWPZDCcFEHMNPASQ@mail.gmail.com>
References: <CABMxt4i6k7YMg79fwmxAJ6wW61g9ygyuOOGWPZDCcFEHMNPASQ@mail.gmail.com>
Message-ID: <CABMxt4hFuZkVYTYNiRj8RBeX1teg_L=4_vpCEQOMTqFENjdPqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to use Buildroot for CraneBoard...
My problem is with configuration files : MLO, u-boot.bin and uImage.
I installed the last RC buildroot and after I started to configure the build
 by selecting the desired setting because i dont found a defconfig file for
Kernel with buildroot ...
In the configuration of the bootloader I checked xloader and uboot. With
uboot I found a configuration file to my card "am3517_crane" but, for
xloader, I haven't found anything and I cannot generate the correspendant
MLO .

I copy MLO, which was provided for Angstrom distrib for my card (compiled
whith openembedded) but I cannot load the u-boot. suddenly, I also tried
copying uboot that provided with the same distrib of  MLO and then I start but
I am blocked on: "booting the kernel"!

Could you tell me why i have this freeze ?
Could you tell me what I do with buildroot to find the xloader configuration
file to my card ?

thnx
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120223/84876a75/attachment-0001.html>
