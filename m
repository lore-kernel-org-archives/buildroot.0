From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 23:19:51 +0200
Subject: [Buildroot] [autobuild-script] confis: update Kconfig symbols
 for sourcery toolchains
In-Reply-To: <1469394885-15001-1-git-send-email-romain.naour@gmail.com>
References: <1469394885-15001-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724231951.508a3383@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 23:14:45 +0200, Romain Naour wrote:
> All BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_<arch><version> symbols
> has been renamed to BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_<arch> since
> Buildroot only support one version of these toolchains.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  web/toolchains/configs/sourcery-arm-armv4t.config | 2 +-
>  web/toolchains/configs/sourcery-arm.config        | 2 +-
>  web/toolchains/configs/sourcery-mips.config       | 2 +-
>  web/toolchains/configs/sourcery-mips64.config     | 2 +-
>  web/toolchains/configs/sourcery-sh.config         | 2 +-
>  web/toolchains/configs/sourcery-x86-64.config     | 2 +-
>  web/toolchains/configs/sourcery-x86.config        | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
