From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:52:00 +0200
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery
 NIOSII to 2018.05
In-Reply-To: <20180530202958.8993-1-romain.naour@gmail.com>
References: <20180530202958.8993-1-romain.naour@gmail.com>
Message-ID: <20180530225200.04815483@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 May 2018 22:29:58 +0200, Romain Naour wrote:
> Re-add BR2_TOOLCHAIN_HAS_SSP since the toolchain support SSP.
> 
> Tested with qemu_nios2_10m50_defconfig and Qemu 2.10.1-3.fc27 release.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-codesourcery-niosII/Config.in        | 13 +++++++------
>  .../toolchain-external-codesourcery-niosII.hash             | 10 +++++-----
>  .../toolchain-external-codesourcery-niosII.mk               |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
