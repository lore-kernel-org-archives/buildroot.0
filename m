From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 16:36:05 +0200
Subject: [Buildroot] [PATCH 0/2] xtensa noMMU support
In-Reply-To: <CAMo8Bf+D8=R3bhnpqqPGmchKeE-QitgewSr59DDkv7tNJ1WsAw@mail.gmail.com>
References: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
 <20160331035749.2a03ba86@free-electrons.com>
 <CAMo8Bf+D8=R3bhnpqqPGmchKeE-QitgewSr59DDkv7tNJ1WsAw@mail.gmail.com>
Message-ID: <20160331163605.51afd1dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 06:20:51 +0300, Max Filippov wrote:

> > Is this actually the case?
> 
> The following patch would switch to elf2flt version that has xtensa support:
>   https://patchwork.ozlabs.org/patch/599708/

Ah, ok. I need to respin this series then.

> But I realize that elf2flt build is not enabled for xtensa, even with the
> above patch. I'll send a fix that enables it.

Seen your patch, thanks!

> It is possible to run noMMU kernel and userspace on MMUv3 cores
> with the mainline QEMU. Real noMMU cores need a fix that wasn't
> accepted to the QEMU mainline:
>   http://qemu.11.n7.nabble.com/PATCH-0-3-target-xtensa-xtfpga-support-cores-without-MMU-td358668.html
> I probably need to get back to it and make suggested changes.

OK.

Do you think you could submit a minimal defconfig that creates a noMMU
Xtensa system that runs under Qemu? I think it would be quite useful,
as it would the first noMMU Qemu configuration that we would have in
Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
