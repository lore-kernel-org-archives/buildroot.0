From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 02 Nov 2020 12:07:53 +0200
Subject: [Buildroot] Booting QEMU
In-Reply-To: <CAB9G97pWnpMk+nDQ6=KEya5DupyyxFdt_uB7=MexNok7mR8s0A@mail.gmail.com>
References: <CAB9G97pWnpMk+nDQ6=KEya5DupyyxFdt_uB7=MexNok7mR8s0A@mail.gmail.com>
Message-ID: <87v9eoqdfq.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sadiq,

On Mon, Nov 02 2020, Sadiq Hussain Muchumarri wrote:
> I've followed the below steps for a QEMU build:
>
> 1)cloned the LTS version of buildroot from GitHub
>
> 2)make clean
>
> 3)make distclean
>
> 4)make qemu_arm_vexpress_defconfig
>
> 5)make
>
> All the above steps are succesfull and I can see the artifacts in
> output/images directory.
>
> May I know how do I boot the QEMU now?

See the command line in board/qemu/arm-vexpress/readme.txt.

baruch

> I see a start-qemu.sh script under output/images directory.
>
> But, that doesn't work out of the box as it says:
> "Invalid SD card size: 60MiB"
>
> Any alternative to this?
> Thanks:)

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
