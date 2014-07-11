From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jul 2014 08:10:49 +0200
Subject: [Buildroot] Boundary U-Boot files (was [PATCH] nitrogen6x:
 include .dtb files...)
In-Reply-To: <53BEDD03.9030103@boundarydevices.com>
References: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>	<1405012684-30163-1-git-send-email-eric.nelson@boundarydevices.com>	<20140710172818.GE28300@free.fr>
 <CADCpmyOL9bGFzjKe-4NRZ2Fwm7o-q8jzJ+u0McyfQeWqbPZyQA@mail.gmail.com>
 <53BEDD03.9030103@boundarydevices.com>
Message-ID: <53BF7FE9.90106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/14 20:35, Eric Nelson wrote:
> Thanks for the ping, Gary.
> 
> On 07/10/2014 11:22 AM, Gary Bisson wrote:
>> Eric, All,
>>
>> What about the bootloader configuration? I know the same bootloader will
>> work the same for sabrelite and nitrogen6q. However for the max and dl
>> versions I guess need another config as the DCD table will be different.
>> Do we want to create other defconfigs?
>>
> 
> As our boards don't require U-Boot to be built in order to
> craft a filesystem (U-Boot runs from SPI NOR), we could simply
> remove the build target.
> 
> At the very least, we should probably find a way to rename the U-Boot
> binary (u-boot.imx) to make it clear that the one built is for
> the Quad-Core/1GiB variant.

 I think it's best to still build the bootloader for one variant, and mention in
the readme.txt the different variants and how to build their bootloaders.

 That readme anyway needs to be extended a bit since it doesn't mention how to
install the kernel or the bootloader.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
