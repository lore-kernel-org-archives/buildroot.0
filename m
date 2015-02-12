From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 12 Feb 2015 20:56:13 +0100
Subject: [Buildroot] [PATCH 1/1] Add default configuration for Raspberry
 Pi 2 (ARMv7 & NEON)
In-Reply-To: <20150212190940.GA4277@free.fr>
References: <20150211175219.22579465@hebden.net.au>
 <20150212190940.GA4277@free.fr>
Message-ID: <54DD055D.9080102@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 02/12/2015 08:09 PM, Yann E. MORIN wrote:
> James, All,
>
> On 2015-02-11 17:52 +1100, James Hebden spake thusly:
>>  From f73918e7f673845086503011d6130d4805e26549 Mon Sep 17 00:00:00 2001
>> From: James Hebden <james@hebden.net.au>
>> Date: Tue, 10 Feb 2015 08:51:50 +1100
>> Subject: [PATCH 1/1] Added RPi2
>>
>> I've put together a simple patch to add default a default config for
>> the Raspberry Pi 2 Model B. Unlike earlier models the RPi2 supports
>> ARMv7 instructions and NEON - so I've enabled those whilst compiling.
>> It also sports a quad core processor so I've enabled SMP - those are
>> the only substantial changes from the default configurations for the
>> first edition Raspberry Pi. I've build and tested against a Raspberry
>> Pi 2 model B booting from SD card and couldn't find any issues with the
>> resulting image.
>>
>> Signed-off-by: James Hebden <james@hebden.net.au>
> Thank you for this patch.
>
> However, here are a few comments:
>
>    - your mailer wrapped long lines, so we can not apply it; please use
>      "git-send-email" to send patches;
>
>    - you provide a full Linux config file; this is huge and should be
>      reduced to a defconfig. Use "make update-linux-defconfig" in your
>      build directory to get a linux defconfig file;
>      (B.B.: it's a pity they are not yet bundling a bcmrpi2_defconfig in
>      the Linux kernel tree...)

The Linux defconfig for the Pi 2 is called bcm2709_defconfig


Yours sincerely,

Floris Bos
