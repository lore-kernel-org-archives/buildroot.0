From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:23:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/ghostscript: fix build with
 freetype >= 2.10.3
In-Reply-To: <20201106214932.3051852-1-bernd.kuhls@t-online.de>
References: <20201106214932.3051852-1-bernd.kuhls@t-online.de>
Message-ID: <20201107132300.116b4087@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Nov 2020 22:49:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> This patch is needed to fix the build with freetype >= 2.10.3.
> 
> https://www.freetype.org/index.html#news
> "A warning for distribution maintainers: Version 2.10.3 and later may
>  break the build of ghostscript, due to ghostscript's use of a with-
>  drawn macro that wasn't intended for external usage."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...g-702985-drop-use-of-FT_CALLBACK_DEF.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
