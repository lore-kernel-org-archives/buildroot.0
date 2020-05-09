From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 15:03:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/util-linux: renumber patches
In-Reply-To: <20200507224150.242211-1-fontaine.fabrice@gmail.com>
References: <20200507224150.242211-1-fontaine.fabrice@gmail.com>
Message-ID: <20200509150331.23a58e1b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 May 2020 00:41:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 3052da3eac8c80e7375341a48bca4cf0ee12e60b did not renumber
> remaining patches, fix that
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...add-force.patch => 0001-blkdiscard-use-O_EXCL-add-force.patch} | 0
>  ...=> 0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch} | 0  
>  ...patch => 0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch} | 0
>  ...04-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch} | 0
>  ...d-inckudes.patch => 0005-include-cleanup-pidfd-inckudes.patch} | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/util-linux/{0003-blkdiscard-use-O_EXCL-add-force.patch => 0001-blkdiscard-use-O_EXCL-add-force.patch} (100%)
>  rename package/util-linux/{0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch => 0002-libfdisk-add-fdisk_set_disklabel_id_from_string.patch} (100%)
>  rename package/util-linux/{0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch => 0003-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch} (100%)
>  rename package/util-linux/{0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch => 0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch} (100%)
>  rename package/util-linux/{0007-include-cleanup-pidfd-inckudes.patch => 0005-include-cleanup-pidfd-inckudes.patch} (100%)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
