From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Nov 2016 11:48:14 +0200
Subject: [Buildroot] [PATCH] patchelf: bump version to 0.9
In-Reply-To: <20161109094346.5839-1-jezz@sysmic.org>
References: <20161109094346.5839-1-jezz@sysmic.org>
Message-ID: <20161109094814.hiomprcg2fxeh2tc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Wed, Nov 09, 2016 at 10:43:46AM +0100, J?r?me Pouiller wrote:
> -PATCHELF_VERSION = 0.8
> -PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8
> +PATCHELF_VERSION = 0.9
> +PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.9

Unrelated to this patch, but SITE should be 
http://releases.nixos.org/patchelf/patchelf-$(PATCHELF_VERSION). And while at 
it we can also move to .tar.bz2 file to save some space.

>  PATCHELF_LICENSE = GPLv3+
>  PATCHELF_LICENSE_FILES = COPYING

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
