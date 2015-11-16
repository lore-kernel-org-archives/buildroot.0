From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Nov 2015 20:42:37 +0200
Subject: [Buildroot] [PATCH 1/2] vboot-utils: new package
In-Reply-To: <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
Message-ID: <20151116184237.GL9908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

On Mon, Nov 16, 2015 at 07:54:25PM +0200, Alex Suykov wrote:
> Host utilities for working with Chromium OS verified boot images.
> Needed to create signed kernel images and manipulating bootable
> partitions for Chromium OS bootloaders.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

[...]

> +VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
> +VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
> +VBOOT_UTILS_SITE_METHOD = git
> +VBOOT_UTILS_LICENSE = BSD

Please add 'VBOOT_UTILS_LICENSE_FILES = LICENSE'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
