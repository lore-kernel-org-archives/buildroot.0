From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:08:34 +0200
Subject: [Buildroot] [PATCH] package/alsa-lib: bump to version 1.1.9
In-Reply-To: <20190601103449.32716-1-joerg.krause@embedded.rocks>
References: <20190601103449.32716-1-joerg.krause@embedded.rocks>
Message-ID: <20190601150834.69968f10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Jun 2019 12:34:49 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop patch 0002 which is included in the new version.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...onally-enable-libdl-in-AM_PATH_ALSA-.patch | 49 -------------------
>  package/alsa-lib/alsa-lib.hash                |  2 +-
>  package/alsa-lib/alsa-lib.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 51 deletions(-)
>  delete mode 100644 package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
