From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to 5.6
In-Reply-To: <20200414161511.328624-1-bernd.kuhls@t-online.de>
References: <20200414161511.328624-1-bernd.kuhls@t-online.de>
Message-ID: <20200415214954.730ed5c5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 18:15:11 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> https://btrfs.wiki.kernel.org/index.php/Changelog#By_version_.28btrfs-progs.29
> 
> Removed patches applied upstream:
> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=9a03f6d41f8e6b3312dc0c87563d8dbd10eafafe
> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=4b3e22e988c26c6c814f9ad3f50f493cd4d9dd2a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-static-library-and-headers-in-insta.patch | 51 -------------------
>  ...ine-BTRFS_DISABLE_BACKTRACE-when-bui.patch | 42 ---------------
>  package/btrfs-progs/btrfs-progs.hash          |  2 +-
>  package/btrfs-progs/btrfs-progs.mk            |  2 +-
>  4 files changed, 2 insertions(+), 95 deletions(-)
>  delete mode 100644 package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
>  delete mode 100644 package/btrfs-progs/0002-kerncompat.h-define-BTRFS_DISABLE_BACKTRACE-when-bui.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
