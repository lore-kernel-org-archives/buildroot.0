From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 09:52:16 +0200
Subject: [Buildroot] [PATCH v2] boot/opensbi: bump to 0.5
In-Reply-To: <20191016225525.12804-1-alistair.francis@wdc.com>
References: <20191016225525.12804-1-alistair.francis@wdc.com>
Message-ID: <20191017095216.2e6ec988@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 15:55:25 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> Bump OpenSBI to the latest version. We need a patch for RV32 to avoid
> hard/soft float build failures.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2:
>  - Fixup title
>  - Add COPYING.BSD SHA
>  - Apply patch to all OpenSBI builds

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
