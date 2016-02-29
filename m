From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:53:22 +0100
Subject: [Buildroot] [PATCH/next 11/31] package/kodi: Remove dependency
 for BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 from sub packages
In-Reply-To: <1456006176-21308-12-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-12-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229235322.25c80fe0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:16 +0100, Bernd Kuhls wrote:
> Kodi itself already depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7, there is
> no need to duplicate this as reverse dependencies in sub options which
> depend on Kodi.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-argustv/Config.in | 4 ----
>  package/kodi-pvr-filmon/Config.in  | 4 ----
>  package/kodi-pvr-pctv/Config.in    | 4 ----
>  package/kodi-pvr-stalker/Config.in | 4 ----
>  4 files changed, 16 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
