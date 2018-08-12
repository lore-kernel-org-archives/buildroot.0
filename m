From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:08:35 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/qt5/qt5base: fix statx
 support with glibc >= 2.28
In-Reply-To: <20180812090840.23436-1-bernd.kuhls@t-online.de>
References: <20180812090840.23436-1-bernd.kuhls@t-online.de>
Message-ID: <20180812140835.432afd4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 11:08:40 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../qt5base/5.11.1/0002-qtbase-glibc.patch    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch
> 
> diff --git a/package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch b/package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch
> new file mode 100644
> index 0000000000..d726bb027f
> --- /dev/null
> +++ b/package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch
> @@ -0,0 +1,52 @@
> +Fix statx support with glibc >= 2.28
> +
> +Ported statx-related changes from
> +https://src.fedoraproject.org/cgit/rpms/qt5-qtbase.git/plain/qt5-qtbase-glibc.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Please, please, please: Git-formatted patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
