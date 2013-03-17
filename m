From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Mar 2013 14:02:15 +0200
Subject: [Buildroot] [PATCH v2] rework patch model
In-Reply-To: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
References: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130317120215.GH5654@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Sun, Mar 17, 2013 at 11:08:09AM +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
> to the patch logic was discussed. See 
> 
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
> 
> for details. In summary:
> 
> * For patches stored in the package directory, if package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch, otherwise, apply package/<pkg>/*.patch
> * For patches stored in the global patches directory, if $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
> 
> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
> the generic package infrastructure to implement the new patch logic.

Sorry for not mentioning it in my first review, but commit log message lines 
should be wrapped at 80 characters.

Thanks,
baruch

> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  v2: Add documentation, as suggested by Baruch Siach

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
