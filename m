Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CABC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 08:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AFC840110;
	Thu,  3 Feb 2022 08:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fnd7L49P4jT7; Thu,  3 Feb 2022 08:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADCEB4011C;
	Thu,  3 Feb 2022 08:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A83F91BF403
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 08:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9597C4011C
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 08:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrLGzhXJ7cNl for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 08:14:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB6A940110
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 08:14:36 +0000 (UTC)
Received: from [77.244.183.192] (port=61970 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nFXGE-0001z0-Ci; Thu, 03 Feb 2022 09:14:34 +0100
Message-ID: <57bd27fd-09c8-9441-8429-bb4983287c6c@lucaceresoli.net>
Date: Thu, 3 Feb 2022 09:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: it-IT
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220202165555.3497977-1-nealf@xilinx.com>
 <c36be0d9-f525-ff0b-5b05-d5f512f92105@lucaceresoli.net>
 <SJ0PR02MB7758DE2233B5C11EC28FCCB4D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB7758DE2233B5C11EC28FCCB4D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 03/02/22 07:20, Neal Frager wrote:
> Hi Luca,
> 
> Thank you for your positive feedback.  Below you can find my thoughts.
> 
> Neal Frager
> Embedded Processor Specialist
> Xilinx
> 
> neal.frager@xilinx.com
> Mobile: +33.6.48.11.37.36
> www.linkedin.com/in/neal-frager-0397463
> 
> -----Original Message-----
> From: Luca Ceresoli <luca@lucaceresoli.net> 
> Sent: Wednesday 2 February 2022 23:29
> To: Neal Frager <nealf@xilinx.com>; buildroot@buildroot.org
> Cc: Neal Frager <nealf@xilinx.com>
> Subject: Re: [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to Xilinx 2021.2
> 
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
> 
> 
> Hi Neal,
> 
> thank you for your effort and for sending a patch in the format that is the most convenient for other people to review your code.
> 
> Your work seems generally in a good shape. I have several remarks, see below, but nothing really problematic.
> 
> On 02/02/22 17:55, Neal Frager wrote:
>> Signed-off-by: Neal Frager <nealf@xilinx.com>
> 
> Maybe you can add more details before the Signed-off-by line, suah as "Also add a defconfig for ZCU102", "remove U-Boot and ATF patches not upstream"...
> 
> [Neal] Could you share the proper git commands for adding comments to a patch?  I would be happy to add more comments, but I am a bit new to git, and I do not know what commands I need to use.

The command 'git commit' opens an editor where you can write a commit
message with all the details you wish. And if you have already done your
commit and want to modify the comment, use 'git commit --amend'.

A suggested reading is ProGit, the official git book:
https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository

A few suggestions on how to write a good commit message:
https://cbea.ms/git-commit/

> First issue: this defconfig does not build on my PC:
> 
> $ git clean -xdf && make zynqmp_zcu106_defconfig && verynice make
> package/pkg-generic.mk:266: *** BR2_GLOBAL_PATCH_DIR contains nonexistent directory board/zynqmp/patches/.  Stop.
> $
> 
> As you removed all patches (which is sooo gooood!) you now have to remove the BR2_GLOBAL_PATCH_DIR.
> 
> [Neal] I have not seen this error on my side, but to fix it, I will just remove the BR2_GLOBAL_PATCH_DIR from the defconfigs.
> 
>> ---
>>  board/zynqmp/genimage.cfg                     |   1 +
>>  ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 -------  
>> ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ------  
>> ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ------------  
>> ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 -------  
>> ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ------------------
>>  configs/zynqmp_zcu102_defconfig               |  35 ++++
>>  configs/zynqmp_zcu106_defconfig               |  15 +-
>>  8 files changed, 44 insertions(+), 484 deletions(-)  delete mode 
>> 100644 
>> board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC
>> -ignore-Warray-bounds.patch  delete mode 100644 
>> board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-bootin
>> g.patch  delete mode 100644 
>> board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.pat
>> ch  delete mode 100644 
>> board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-f
>> or-PMUFW_INIT_.patch  delete mode 100644 
>> board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init
>> -file-as-a-kco.patch  create mode 100644 
>> configs/zynqmp_zcu102_defconfig
>>
>> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg 
>> index ed202f4550..557364e124 100644
>> --- a/board/zynqmp/genimage.cfg
>> +++ b/board/zynqmp/genimage.cfg
>> @@ -3,6 +3,7 @@ image boot.vfat {
>>               files = {
>>                       "boot.bin",
>>                       "u-boot.bin",
>> +                     "u-boot.itb",
> 
> Is u-boot.bin still needed, when we have the .itb?
> 
> [Neal] u-boot.bin is no longer needed.  I can remove it.
> 
>> diff --git a/configs/zynqmp_zcu106_defconfig 
>> b/configs/zynqmp_zcu106_defconfig index bee7c1daf7..3a6947e1e8 100644
>> --- a/configs/zynqmp_zcu106_defconfig
>> +++ b/configs/zynqmp_zcu106_defconfig
>> @@ -1,11 +1,11 @@
>>  BR2_aarch64=y
>>  BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
>> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
>> @@ -14,21 +14,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y  # 
>> BR2_TARGET_ROOTFS_TAR is not set  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y  
>> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
>> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.4_2021.2"
> 
> As far as I remember (but I ask the core developers to confirm or deny), from the Buildroot perspective upstream versions are generally preferred even when they lack some non-fundamental features (e.g.: some drivers are missing) that are in vendor forks.
> 
> Is there a reason for switching ATF to the Xilinx fork? In this case explain it in the commit message, otherwise stay on the upstream repo, upgrading to the latest [working] release.
> 
> A similar question applies to kernel and U-Boot: is it possible to switch to upstream releases?
> 
> [Neal] I was trying to match the Xilinx tested software release 2021.2 with these patches.  The mainline Linux kernel is still missing quite a bit of the Xilinx drivers, so if a developer uses all mainline locations, there will be things that do not work properly.  The ATF should probably be ok, as it is almost identical to the Xilinx fork, but since I was already using the Xilinx fork for the Linux kernel and U-Boot, I thought it would be better to use the Xilinx tested fork for everything to remain consistent.

I can understand that mainline Linux has significantly fewer drivers
than the Xilinx fork. However I have good hope that current mainline
U-Boot is enough to boot properly, at least it's worth giving it a try
and, should it fail, explain what's the problem that forces to stay on a
fork.

About ATF I would just stay on mainline. I would be surprised if an old
mainline version worked and not a recent one.

> Ouch, now the build I had started ended with a new error:
> 
>>>> arm-trusted-firmware xlnx_rebase_v2.4_2021.2 Building
> ...
>   AR      .../build/zynqmp/release/lib/libc.a
>   LD      .../build/zynqmp/release/bl31/bl31.elf
> .../aarch64-buildroot-linux-uclibc-ld:
> .../build/zynqmp/release/bl31/bl31.elf section `coherent_ram' will not fit in region `RAM'
> .../aarch64-buildroot-linux-uclibc-ld: BL31 image has exceeded its limit.
> .../aarch64-buildroot-linux-uclibc-ld: region `RAM' overflowed by 1 byte
> 
> I have run my build on Ubuntu 18.04 with your patch applied on current master.
> 
> I assume you have built and run it successfully. Any idea on why it fails on a different host?
> 
> [Neal] I have seen the ATF build error as well.  There seems to be an issue with the default buildroot aarch64-buildroot-linux-uclibc compiler when building the ATF.  I fixed the issue on my side by going into the output/build/arm-trusted-firmware-xlnx_rebase_v2.4_2021.2 and running the build with the aarch-none-elf compiler using the build command below.  Basically, changing nothing but the compiler.  Do you have any thoughts about how to fix this?
> 
> make CROSS_COMPILE=aarch64-none-elf- PLAT=zynqmp RESET_TO_BL31=1

I'm afraid a defconfig that requires manual steps to build is a no-go,
so we really need a solution.

I don't know a proper solution, but first why don't you try mainline
ATF? Should it build (and run) it'd be a double win! :) Otherwise you
could try another toolchain, such as one prebuilt on
https://toolchains.bootlin.com/ .

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
