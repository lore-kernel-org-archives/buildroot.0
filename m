From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:36:51 +0200
Subject: [Buildroot] [PATCH] package/unionfs: bump to 2.1
In-Reply-To: <20200421181753.30643-1-matthew.weber@rockwellcollins.com>
References: <20200421181753.30643-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200421213651.12414f85@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 13:17:53 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Dropped 0001-include-asm-ioctl.h-for-_IOC_SIZE.patch
>  https://github.com/rpodgorny/unionfs-fuse/commit/dea8e4ddbef946b1ff53782dd1669daa44564173#diff-25d902c24283ab8cfbac54dfa101ad31
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...01-include-asm-ioctl.h-for-_IOC_SIZE.patch | 26 -------------------
>  package/unionfs/unionfs.hash                  |  3 +--
>  package/unionfs/unionfs.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 29 deletions(-)
>  delete mode 100644 package/unionfs/0001-include-asm-ioctl.h-for-_IOC_SIZE.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
