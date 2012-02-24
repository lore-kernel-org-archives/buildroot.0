From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 24 Feb 2012 08:33:08 +0100
Subject: [Buildroot] Craneborad and Buildroot
In-Reply-To: <CABMxt4hvmfTZXjL=b9=W6J-0-DSDjxzzmGTAPx-ghsXgTk8+HA@mail.gmail.com>
References: <CABMxt4gbvhDEkY315AVrRqyqQx1gE3=P3PaZ0Wcnj74J=ieJFQ@mail.gmail.com>
 <4F465DA0.7040407@visionsystems.de>
 <CABMxt4hvmfTZXjL=b9=W6J-0-DSDjxzzmGTAPx-ghsXgTk8+HA@mail.gmail.com>
Message-ID: <4F473D34.8000008@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You are welcome.

There is something wrong with newer CodeSourcery and native toolchains. This question should be asked on the u-boot mailing list.

Please always add buildroot's address to CC, so that everybody can follow our conversation or participate on it.

Best regards,
Yegor

Am 23.02.2012 17:17, schrieb Mohamed HAMZAOUI:
> thank you for your response.
>
> I used a Buildroot toolchain. i will try with ct-ng but it's this impossible with buildroot toolchain ?
>
> Best regards,
> Mohamed
>
> On Thu, Feb 23, 2012 at 4:39 PM, Yegor Yefremov <yegor_sub1 at visionsystems.de <mailto:yegor_sub1@visionsystems.de>> wrote:
>
>     Am 23.02.2012 16:36, schrieb Mohamed HAMZAOUI:
>     > Hi,
>     >
>     > I want to use Buildroot for CraneBoard...
>     >
>     > My problem is with configuration files : MLO, u-boot.bin and uImage.
>     > I installed the last RC buildroot and after I started to configure the build by selecting the desired setting because i dont found a defconfig file for Kernel with buildroot ...
>     >
>     > In the configuration of the bootloader I checked xloader and uboot. With uboot I found a configuration file to my card "am3517_crane" but, for xloader, I haven't found anything and I cannot generate the correspendant MLO .
>     >
>     > I copy MLO, which was provided for Angstrom distrib for my card (compiled whith openembedded) but I cannot load the u-boot. suddenly, I also tried copying uboot that provided with the same distrib of  MLO and then I start but I am blocked on: "booting the kernel"!
>     >
>     > Could you tell me why i have this freeze ?
>     > Could you tell me what I do with buildroot to find the xloader configuration file to my card ?
>
>     What toolchain are you using? Try ct-ng. I have reported the problems with CodeSourcery and native toolchains recently.
>
>     Best regards,
>     Yegor
>
>
