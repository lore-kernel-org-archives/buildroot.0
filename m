From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:30:03 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/synergy: bump version to
 2.0.12-beta
In-Reply-To: <20180819210835.13321-1-bernd.kuhls@t-online.de>
References: <20180819210835.13321-1-bernd.kuhls@t-online.de>
Message-ID: <20180819233003.496215f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 23:08:35 +0200, Bernd Kuhls wrote:
> Normally we do not use beta versions but 1.x versions are incompatible
> with openssl-1.1.x and openssl support was dropped in synergy with
> version 2.0.4: https://github.com/symless/synergy-core/releases
> 
> Also libcurl is not needed anymore since version 2.0.12.
> 
> Added license hash, removed all patches since they fixed bugs which do
> not exist anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ow-building-of-synergy-without-tests.patch | 86 -------------------
>  ...e-output-path-when-building-in-debug.patch | 33 -------
>  package/synergy/Config.in                     |  2 -
>  package/synergy/synergy.hash                  |  3 +-
>  package/synergy/synergy.mk                    |  4 +-
>  5 files changed, 4 insertions(+), 124 deletions(-)
>  delete mode 100644 package/synergy/0001-allow-building-of-synergy-without-tests.patch
>  delete mode 100644 package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
