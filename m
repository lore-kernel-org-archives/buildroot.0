From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Jul 2017 16:09:29 +0300
Subject: [Buildroot] [PATCH v6 2/2] fs/ext2: Add
 BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
In-Reply-To: <20170705130100.441-2-s.martin49@gmail.com>
References: <20170705130100.441-1-s.martin49@gmail.com>
 <20170705130100.441-2-s.martin49@gmail.com>
Message-ID: <20170705130929.ik7ckvllo764rnuv@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Wed, Jul 05, 2017 at 03:01:00PM +0200, Samuel Martin wrote:
> +	  The default is "-O ^64bit", i.e. disable the 64-bit filesystem.
> +	  This is chosen because U-Boot versions before 2017.02 don't
> +	  support that filesystem option, which may render the system
> +	  unbootable if it is used.

Maybe also mention that this option is only useful for 2TB+ filesystems.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
