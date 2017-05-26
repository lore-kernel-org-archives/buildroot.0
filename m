From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 14:58:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/dosfstools: bump version
 to 4.1
In-Reply-To: <20170525225620.6992-1-bernd.kuhls@t-online.de>
References: <20170525225620.6992-1-bernd.kuhls@t-online.de>
Message-ID: <20170526145849.2fe534a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 May 2017 00:56:20 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0001-mkfs-Default-to-64-32-heads-sectors-for-targets-smalle.patch
> https://github.com/dosfstools/dosfstools/commit/1e76e5778a1885452939a79d9145b80634a5b023
> 
> 0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch
> https://github.com/dosfstools/dosfstools/commit/69ac2b0706ff01ea7a8b6efd9f9efa2481895261
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...to-64-32-heads-sectors-for-targets-smalle.patch | 42 ----------------------
>  ..._info.c-Fix-undefined-PATH_MAX-under-musl.patch | 31 ----------------
>  package/dosfstools/dosfstools.hash                 |  2 +-
>  package/dosfstools/dosfstools.mk                   |  2 +-
>  4 files changed, 2 insertions(+), 75 deletions(-)
>  delete mode 100644 package/dosfstools/0001-mkfs-Default-to-64-32-heads-sectors-for-targets-smalle.patch
>  delete mode 100644 package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
