From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:05:54 +0100
Subject: [Buildroot] [PATCH v4 1/5] board/qemu/riscv32-virt: Update
 linux config
In-Reply-To: <20190319181449.25067-1-alistair.francis@wdc.com>
References: <20190319181449.25067-1-alistair.francis@wdc.com>
Message-ID: <20190319220554.79290acf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Mar 2019 18:15:46 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Update the Linux defconfig. This defconfig is the in tree defconfig with
> 32-bit support enabled.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

If it's just the in-tree defconfig + one option to enable 32-bit
support, what about using the in-tree defconfig directly + a small
config fragment to enable 32-bit support ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
