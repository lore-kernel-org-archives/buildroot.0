From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 25 Oct 2012 14:22:24 +0300
Subject: [Buildroot] [PATCH 9/9] firefox: GNU gnash flash,
 an open source Adobe Flash player & plugin
In-Reply-To: <508852EB.4070401@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
 <5082C97A.4090207@mind.be> <5083E62E.80705@petroprogram.com>
 <5086C8E7.6070209@mind.be> <5087F087.8010307@petroprogram.com>
 <508852EB.4070401@mind.be>
Message-ID: <508920F0.6090507@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

24.10.2012 23:43, Arnout Vandecappelle kirjoitti:
> On 24/10/12 15:43, Stefan Fr?berg wrote:
>> I just read the following:
>> http://www.extremetech.com/mobile/137412-linux-kernel-version-3-7-will-support-multiple-arm-socs
>>
>>
>> So it seems things are now getting more easier.
>>
>> Im certainly going to upgrade to that kernel version and try if I have
>> better luck
>> this time with exonys board (basically the same stuff that those Samsung
>> Galaxy S II and III are using ????)
>> under qemu.
>
>  AFAIK that board is not yet part of the multiplatform patch.  And
> anyway, you
> still need a boot loader that sets up the SDRAM correctly, so you
> still need the
> correct U-Boot/Barebox/... config.
>
>  But what is your problem exactly?  Set the kernel defconfig to
> 'exynos' and all
> is well, no?
>

For some reason I could not get it booting.  Just black screen in qemu.
Maybe I messed something in linux-menuconfig or is it because it needs
boot loader ?

But I could boot versatile image without anykind boot loader in the
image with this:

qemu-system-arm   -M versatilepb -kernel zImage -initrd initramfs.xz
-append "root=/dev/ram0"

Best regards
Stefan

>  Regards,
>  Arnout
>
