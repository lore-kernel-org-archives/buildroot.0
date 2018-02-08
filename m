From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:16:23 +0100
Subject: [Buildroot] [PATCH 3/3] package/rauc: Version bump to 0.3
In-Reply-To: <7bc2ac0c52c4a9bb10d7abd7d321a55ace1eb965.1518089469.git.jan.kundrat@cesnet.cz>
References: <45c17d05433e7bb40ff6e2b30c5cb41fed04ec76.1518089469.git.jan.kundrat@cesnet.cz>
 <7bc2ac0c52c4a9bb10d7abd7d321a55ace1eb965.1518089469.git.jan.kundrat@cesnet.cz>
Message-ID: <20180208221623.47c2c652@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Feb 2018 10:27:47 +0100, Jan Kundr?t wrote:
> There's a bug in 0.2 which prevents proper operation when activated via
> D-Bus, which is why I'm bumping this.
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> Link: https://github.com/rauc/rauc/issues/125
> ---
>  package/rauc/rauc.hash | 4 ++--
>  package/rauc/rauc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
