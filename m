From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Mar 2015 13:45:25 +0200
Subject: [Buildroot] [PATCH 1/1 v3] eudev: fix dependency on kernel
 headers version
In-Reply-To: <1425901067-27699-1-git-send-email-swexru@gmail.com>
References: <1425901067-27699-1-git-send-email-swexru@gmail.com>
Message-ID: <20150309114525.GI2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Mon, Mar 09, 2015 at 02:37:47PM +0300, Alexey Mednyy wrote:
> a/package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch 
> b/package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
> new file mode 100644
> index 0000000..a749b08
> --- /dev/null
> +++ b/package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
> @@ -0,0 +1,37 @@
> +From 6740579367ddd2ce0b315863cdb92d34d1d693c7 Mon Sep 17 00:00:00 2001
> +From: "Anthony G. Basile" <blueness@gentoo.org>
> +Date: Sun, 16 Nov 2014 13:40:43 -0500
> +Subject: [PATCH] configure.ac: don't die on missing linux/btrfs.h, fixes issue
> + #100
> +
> +Signed-off-by: Anthony G. Basile <blueness@gentoo.org>

Since this patch seems to be backported from upstream, its description should 
contain a reference to upstream. In this case saying something like "upstream 
commit 6740579367d" should be enough.

Sorry for not mentioning it previously.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
