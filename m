From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:17:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: remove dependency on
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
In-Reply-To: <20200324214415.1175050-1-bernd.kuhls@t-online.de>
References: <20200324214415.1175050-1-bernd.kuhls@t-online.de>
Message-ID: <20200326231734.2cac0a8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 22:44:15 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream does not require libgcrypt & libgpg-error anymore:
> https://github.com/xbmc/xbmc/commit/0c6e8e0d975d4045004dc2fe90218d61395cdcb5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
