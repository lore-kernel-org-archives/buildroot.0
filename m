From: Mohamed HAMZAOUI <requinham@gmail.com>
Date: Mon, 20 Feb 2012 16:20:31 +0100
Subject: [Buildroot] craneborad and buildroot
Message-ID: <CABMxt4i6k7YMg79fwmxAJ6wW61g9ygyuOOGWPZDCcFEHMNPASQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I recently purchased a development board type CraneBoard...
My problem is with configuration files : MLO, u-boot.bin and uImage.
I installed the last RC buildroot and after I started to configure the build
 by selecting the desired setting ...
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120220/9ae00e7a/attachment-0001.html>
