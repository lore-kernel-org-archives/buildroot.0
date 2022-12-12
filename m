Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1F5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 17:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6269415A3;
	Mon, 12 Dec 2022 17:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6269415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRwxD6AHq5_O; Mon, 12 Dec 2022 17:56:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAB1415A9;
	Mon, 12 Dec 2022 17:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BAB1415A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9771BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C32078134B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C32078134B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxkDOBWgY9aG for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 17:56:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EC1B81342
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EC1B81342
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:56:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C35F82000B;
 Mon, 12 Dec 2022 17:56:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p4n2n-00F69i-JG; Mon, 12 Dec 2022 18:56:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Frank Hunleth <fhunleth@troodon-software.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
Date: Mon, 12 Dec 2022 18:56:49 +0100
In-Reply-To: <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 (Frank Hunleth's message of "Mon, 12 Dec 2022 15:32:40 +0000")
Message-ID: <87pmcoy07y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

Hi,

 >> >>>>> "Indrek" == Indrek Kruusa indrek.kruusa@gmail.com writes:
 >> 
 >> > BR2_TARGET_OPENSBI=y
 >> 
 >> > BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
 >> 
 >> > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call
 >> > github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
 >> 
 >> > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call
 >> > github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
 >> 
 >> 
 >> Why still use this custom opensbi? There is D1 support in version 1.1 as
 >> mentioned on https://linux-sunxi.org/Allwinner_Nezha
 >> 

 > Just in case it helps, I've been testing both the Korsgaard and Kruusa
 > patches on a MangoPI MQ Pro. This board is close, but not exactly like
 > the Nezha, so I expect differences.

 > Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's the error:

Just to be sure, is this with the 5.19 based kernel we used to use
(fe178cf0153d98b71cb01a46c8cc050826a17e77) or the "new" 6.1-rc3 based
one (ca67838d84af4c9f85d06311c9e98e1adf46308f)?


 > Unhandled exception: Store/AMO access fault
 > EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
 > EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted

 > Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)

Sounds like access to an invalid address to me. When does this trigger?
Early doing Linux boot?

I see the mangopi mq-pro only has 512MB RAM. 0x5xxx.xxxx is at the very
end of that (memory starts at 0x4xxx.xxxx), did you update the memory
size in the device tree passed to OpenSBI?

I just did a clean rebuild of nezha_defconfig here, and it boots without
any issues:

U-Boot SPL 2022.10 (Dec 12 2022 - 17:20:45 +0100)
sunxi_ram_probe: dram-controller@3102000: probing
DRAM only have internal ZQ!!
ddr_efuse_type: 0x0
[AUTO DEBUG] two rank and full DQ!
ddr_efuse_type: 0x0
[AUTO DEBUG] rank 0 row = 15
[AUTO DEBUG] rank 0 bank = 8
[AUTO DEBUG] rank 0 page size = 2 KB
[AUTO DEBUG] rank 1 row = 15
[AUTO DEBUG] rank 1 bank = 8
[AUTO DEBUG] rank 1 page size = 2 KB
rank1 config same as rank0
DRAM BOOT DRIVE INFO: V0.24
DRAM CLK = 792 MHz
DRAM Type = 3 (2:DDR2,3:DDR3)
DRAMC ZQ value: 0x7b7bfb
DRAM ODT value: 0x42.
ddr_efuse_type: 0x0
DRAM SIZE =1024 M
DRAM simple test OK.
mxstatus=0xc0408000 mhcr=0x00000109 mcor=0x00000003 mhint=0x00004000
Trying to boot from MMC1
PLL reg = 0xf8216300, freq = 1200000000
SPL size = 81920, sector = 160
sunxi_ram_get_info: dram-controller@3102000: getting info

OpenSBI v1.1
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : Allwinner D1 Nezha
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : ---
Platform Timer Device     : --- @ 0Hz
Platform Console Device   : uart8250
Platform HSM Device       : sun20i-d1-ppu
Platform Reboot Device    : sunxi-wdt-reset
Platform Shutdown Device  : ---
Firmware Base             : 0x40000000
Firmware Size             : 288 KB
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000040000000-0x000000004007ffff ()
Domain0 Region01          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
Domain0 Next Address      : 0x0000000042e00000
Domain0 Next Arg1         : 0x0000000042e8b978
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.11
Boot HART Base ISA        : rv64imafdcvx
Boot HART ISA Extensions  : time
Boot HART PMP Count       : 8
Boot HART PMP Granularity : 2048
Boot HART PMP Address Bits: 38
Boot HART MHPM Count      : 0
Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109
sunxi_set_gate: (CLK#24) unhandled


U-Boot 2022.10 (Dec 12 2022 - 17:20:45 +0100) Allwinner Technology

..

Starting kernel ...

[    0.000000] Linux version 6.1.0-rc3 (peko@dell) (riscv64-buildroot-linux-gnu-gcc.br_real (Buildroot 2022.11-477-g5cb74c92f7) 11.3.0, GNU ld (GNU Binutils) 2.38) #1 PREEMPT Mon Dec 12 17:28:21 CET 2022

..

# uptime
 00:07:05 up 6 min,  load average: 0.00, 0.00, 0.00

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
