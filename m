From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 15:15:34 +0100
Subject: [Buildroot] [PATCH 10/16] package/kodi-screensaver-biogenesis:
 bump version to 2.2.3-Leia
In-Reply-To: <20200309183938.2528-10-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
 <20200309183938.2528-10-bernd.kuhls@t-online.de>
Message-ID: <20200315151534.2b8e4fd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Mar 2020 19:39:32 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-screensaver-biogenesis.hash                          | 4 ++--
>  .../kodi-screensaver-biogenesis.mk                            | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

You forgot to drop the patch adding <stddef.h>, which was applied
upstream, so this package couldn't build. I've fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
