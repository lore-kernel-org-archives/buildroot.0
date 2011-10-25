From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Oct 2011 06:53:59 -0300
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_5/6=5D_qemu=5Fsh4=5Fr2d=3A_update_?=
 =?utf-8?q?to_kernel_3=2E1_and_update_readme?=
In-Reply-To: <87ehy1y4eg.fsf@macbook.be.48ers.dk>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-5-git-send-email-gustavo@zacarias.com.ar>
 <87ehy1y4eg.fsf@macbook.be.48ers.dk>
Message-ID: <d232d63f548d58fc6d7af13f979b9153@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.10.2011 03:24, Peter Korsgaard wrote:

> No serial port emulated? From the defconfig I see:
>
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_SH_SCI=y
> CONFIG_SERIAL_SH_SCI_NR_UARTS=1
>
> I prefer to run the getty on the serial port for the qemu defconfigs,
> because it's closer to what is typically done on hw (and makes it 
> easier
> to reuse rootfs on real hw).

Me too for real embedded targets unlike qemu-system-x86.
Unfortunately either qemu 0.14 doesn't emulate the UART and/or the real 
target doesn't have one.
Regards.
