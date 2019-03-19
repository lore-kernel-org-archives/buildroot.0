From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:06:25 +0100
Subject: [Buildroot] [PATCH v4 2/5] linux: Enable BR2_LINUX_KERNEL_IMAGE
 on RISC-V
In-Reply-To: <20190319181449.25067-2-alistair.francis@wdc.com>
References: <20190319181449.25067-1-alistair.francis@wdc.com>
 <20190319181449.25067-2-alistair.francis@wdc.com>
Message-ID: <20190319220625.3eb4e640@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Mar 2019 18:15:47 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> We will need to build Image files for OpenSBI so allow that now.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
