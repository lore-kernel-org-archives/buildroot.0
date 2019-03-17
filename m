From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 12:14:56 +0100
Subject: [Buildroot] [PATCH] package/bluez-alsa: bump to version 1.4.0
In-Reply-To: <20190316195752.25035-1-joerg.krause@embedded.rocks>
References: <20190316195752.25035-1-joerg.krause@embedded.rocks>
Message-ID: <20190317121456.3c5be4eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 20:57:52 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Also:
> * License file has been renamed: LICENSE.txt -> LICENSE
> * Update license file hash -> List of contributors are in a seperate
> file now
> * Configure option `--with-alsadatadir` has been renamed to `--with-alsaconfdir`
> * Configure option `--enable-pcm-test` has been removed
> * New optional configure option `ofono` (no build dependency, will
> disable internal HFP in favor of oFonos HFP profile)
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/bluez-alsa/bluez-alsa.hash |  4 ++--
>  package/bluez-alsa/bluez-alsa.mk   | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
