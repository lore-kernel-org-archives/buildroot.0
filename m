From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:14:26 +0200
Subject: [Buildroot] [PATCH v7 29/31] package/libsquish: Remove
 Kodi-specific patch
In-Reply-To: <20170429083751.19625-30-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-30-bernd.kuhls@t-online.de>
Message-ID: <20170429121426.240f3fa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:49 +0200, Bernd Kuhls wrote:
> Kodi 17 does not depend on libsquish anymore:
> https://github.com/xbmc/xbmc/commit/ed03f828be3615d294eb4a4cfccc5cdccec22997
> 
> We can therefore remove the patch which was needed for Kodi <= 16.x.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsquish/0001-kodi.patch | 327 --------------------------------------
>  1 file changed, 327 deletions(-)
>  delete mode 100644 package/libsquish/0001-kodi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
