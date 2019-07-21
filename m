From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Jul 2019 15:44:31 +0200
Subject: [Buildroot] [PATCHv2] boot/atf: licensing info is only valid
 for v1.4
In-Reply-To: <20190714173218.22671-1-yann.morin.1998@free.fr>
References: <20190714173218.22671-1-yann.morin.1998@free.fr>
Message-ID: <20190721154431.7d8f1bfe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 19:32:18 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The licensing information, and expecially the name of the license file,
> is known only for the official v1.4 version. For example, in later
> versions, the license file has been renamed.
> 
> Since we can't be sure of the licensing information for custom versions,
> or for versions from git, define that only for the known v1.4 version.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - adopted by Yann from Adam
>   - don't change the filename, but move the licensing info
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
