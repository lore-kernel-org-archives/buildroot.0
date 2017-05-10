From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 10 May 2017 14:12:00 +0300
Subject: [Buildroot] [PATCH 1/1] flex: bump to version v2.6.4
In-Reply-To: <20170510110643.17926-1-aduskett@codeblue.com>
References: <20170510110643.17926-1-aduskett@codeblue.com>
Message-ID: <20170510111200.cybl5dhlbffkakkt@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, May 10, 2017 at 07:06:43AM -0400, Adam Duskett wrote:
> diff --git a/package/flex/0001-fix-cross-compiling-issues.patch 
> b/package/flex/0001-fix-cross-compiling-issues.patch
> new file mode 100644
> index 0000000..ef092c5
> --- /dev/null
> +++ b/package/flex/0001-fix-cross-compiling-issues.patch
> @@ -0,0 +1,49 @@
> +From 31985a4183654c884240c3740f8a24212f8794c2 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@codeblue.com>
> +Date: Tue, 9 May 2017 13:46:18 -0400
> +Subject: [PATCH] fix cross compiling issues
> +
> +the po directory doesn't have a makefile.
> +doc wants help2man that isn't supported by buildroot.

The problem with help2man is that it is inherently incompatible with cross 
compilation. help2man relies on the ability to run the built binary.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
