From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 12:30:27 +0200
Subject: [Buildroot] [PATCH 1/4] configs/pc: bump kernel version
In-Reply-To: <20171022093842.21788-2-nunes.erico@gmail.com>
References: <20171022093842.21788-1-nunes.erico@gmail.com>
 <20171022093842.21788-2-nunes.erico@gmail.com>
Message-ID: <20171022123027.4db50ac2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 11:38:39 +0200, Erico Nunes wrote:
> Bump the kernel version to 4.13.8.
> Tested with qemu 2.9.1 on bios and UEFI virtual machines.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  configs/pc_x86_64_bios_defconfig | 6 +++---
>  configs/pc_x86_64_efi_defconfig  | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks. Would you volunteer to maintain those PC
defconfigs? That would be nice. If you're happy with doing this, you
can send a patch to update the DEVELOPERS file :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
