From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:47:53 +0100
Subject: [Buildroot] [PATCH/next 21/31]
 package/kodi-screensaver-matrixtrails: new package
In-Reply-To: <1456006176-21308-22-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-22-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305154753.57c118c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:26 +0100, Bernd Kuhls wrote:

> diff --git a/package/kodi-screensaver-matrixtrails/0001-cmake.patch b/package/kodi-screensaver-matrixtrails/0001-cmake.patch
> new file mode 100644
> index 0000000..6307544
> --- /dev/null
> +++ b/package/kodi-screensaver-matrixtrails/0001-cmake.patch
> @@ -0,0 +1,33 @@
> +fix linking against libsoil
> +
> +Patch sent upstream
> +https://github.com/notspiff/screensaver.matrixtrails/pull/3

Upstream rejected your patch, saying that it wasn't necessary. Can you
look into this, and resubmit once this issue is resolved?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
