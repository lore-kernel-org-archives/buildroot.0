From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:19:03 +0100
Subject: [Buildroot] [PATCH] package/util-linux: add missing SOB to
 patches
In-Reply-To: <20200313010418.16872-1-unixmania@gmail.com>
References: <20200313010418.16872-1-unixmania@gmail.com>
Message-ID: <20200314151903.40101df8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 22:04:18 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> It is required that all patches in packages have the Signed-off-by of
> the contributor who brought them into Buildroot.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/util-linux/0003-blkdiscard-use-O_EXCL-add-force.patch    | 1 +
>  .../0004-libfdisk-add-fdisk_set_disklabel_id_from_string.patch   | 1 +
>  .../0005-sfdisk-add-disk-id-to-change-disk-UUID-ID.patch         | 1 +
>  3 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
