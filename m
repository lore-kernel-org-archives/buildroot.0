From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 7 Jun 2016 09:45:25 +0200
Subject: [Buildroot] [PATCH 00/10] Bump NXP package versions
In-Reply-To: <0f097ae31f8444679d97f85146459fd5@WEBMAIL.arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <CAAMH-ytGSshRJTZiqmQ4DeztuA5L_GtfnF8aTCUorx9vw87baA@mail.gmail.com>
 <0f097ae31f8444679d97f85146459fd5@WEBMAIL.arcx.com>
Message-ID: <CAAMH-yvvw7DBL_03r3Cc6hBmMvBGfVmBXf2aeXNzfpUgb=01tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Mon, Jun 6, 2016 at 5:57 PM, Andrew Webster <Awebster@arcx.com> wrote:
>><snip>
>> I will comment on each individual patch above but I have a couple of
>> questions:
>> - Why isn't there the kernel-module-imx-gpu-viv update? It is very important
>> to keep it in line with imx-gpu-viv.
>
> We don't use this (yet), so I didn't want to update it without testing it.

Ok, but you can test it on any kernel though, it doesn't require any
modification. If you enable the option, it will remove the built-in
driver dynamically from your kernel configuration and use the module
instead.

>> - What about imx-kobs?
>
> We also don't use this (no NAND on the board).  As above, I didn't want to update without testing.
>
> I can certainly update these versions and confirm that they build, if someone else can test.

I never tested it either since I don't have any NAND on board, making
sure it builds fine is sufficient. Plus I've heard people using it
just fine so I'm not worried and it's still nice to have.

As a FYI, I think SabreAuto is the only one that offers NAND.

>> - Can you share your testing setup (platform name + defconfig)?
>
> Tested on a custom i.MX6Q board.  I used the freescale_imx6qsabresd defconfig, but with a different kernel and toolchain.
>
> We are in the process of updating to the latest 4.1.15 kernel release.  I will update the gpu packages to p8.4 after that and resubmit.

Ok good, thanks for the details.

Thanks,
Gary
