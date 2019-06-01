From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:13:50 +0200
Subject: [Buildroot] [PATCH] package/speexdsp: bump to version 1.2.0
In-Reply-To: <20190601105919.23253-1-joerg.krause@embedded.rocks>
References: <20190601105919.23253-1-joerg.krause@embedded.rocks>
Message-ID: <20190601151350.61b04ad7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Jun 2019 12:59:19 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop patch 0001 which is included in the new release.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-port-resample-neon-to-aarch64.patch  | 250 ------------------
>  package/speexdsp/speexdsp.hash                |   2 +-
>  package/speexdsp/speexdsp.mk                  |   2 +-
>  3 files changed, 2 insertions(+), 252 deletions(-)
>  delete mode 100644 package/speexdsp/0001-port-resample-neon-to-aarch64.patch

Applied to next, thanks. In the next days, please monitor the build
results of vlc, asterisk, freeswitch, libpjsip, linphone,
mediastreamer, as they use speexdsp.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
