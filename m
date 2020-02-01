From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 17:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] squashfs: bump version to 4.4
In-Reply-To: <20200130231751.4773-1-clayton.shotwell@rockwellcollins.com>
References: <20200130231751.4773-1-clayton.shotwell@rockwellcollins.com>
Message-ID: <20200201171336.4520607b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Jan 2020 17:17:51 -0600
Clayton Shotwell <clayton.shotwell@rockwellcollins.com> wrote:

> Bump to version 4.4 and switch to github site since the kernel
> repository has not been updated. See
> https://github.com/plougher/squashfs-tools/blob/master/README.
> 
> Dropping patch that has been incorporated in the new release.
> 
> This version bump includes support for reproducible images. See the full
> release notes for details at
> https://github.com/plougher/squashfs-tools/blob/master/README-4.4
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/squashfs/0001-include-sysmacros.patch | 47 -------------------
>  package/squashfs/squashfs.hash                |  2 +-
>  package/squashfs/squashfs.mk                  |  5 +-
>  3 files changed, 3 insertions(+), 51 deletions(-)
>  delete mode 100644 package/squashfs/0001-include-sysmacros.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
