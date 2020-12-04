From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Dec 2020 09:13:25 +0100
Subject: [Buildroot] [PATCH] Revert "package/gdb: prevent gdbserver
 being selected for RISC-V builds"
In-Reply-To: <20201204014549.2669932-1-vgupta@synopsys.com>
References: <20201204014549.2669932-1-vgupta@synopsys.com>
Message-ID: <20201204091325.31cc0f2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Dec 2020 17:45:49 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> This reverts commit 44a9babcc67cd011e957ba9fd1cf741891957c12.
> 
> As of Buildroot 2020.11 (glibc build of qemu_riscv64_virt_defconfig),
> cross-gdb for RISCV buildis fine and can also attach to a qemu
> instance, so remove the gate on not building it.

Is this true for all gdb versions we support ? We currently support
8.2, 8.3 and 9.2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
