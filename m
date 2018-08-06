From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 6 Aug 2018 20:40:34 +0200
Subject: [Buildroot] [PATCH 0/5] sunxi-mali-mainline-*: add arm64 arch
 and add r8p1
In-Reply-To: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
References: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
Message-ID: <55ef14c2-eaf5-0b4a-63b5-c0149a5d7d49@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches are not bi-sectable, so I need to correct resubmit them as 
only 2 patches, one for sunxi-mali-mainline and one for 
sunxi-mali-mainline-driver.

Sorry, I reject them from patchwork.

Il 25/07/2018 12:06, Giulio Benetti ha scritto:
> On both sunxi-mali-mainline and sunxi-mali-mainline-driver bump version
> to add arm64(aarch64) arch support.
> On sunxi-mali-mainline add r8p1 version.
> 
> Giulio Benetti (5):
>    sunxi-mali-mainline: bump version.
>    sunxi-mali-mainline: add support for arm64(aarch64) architecture.
>    sunxi-mali-mainline: add r8p1 blob version.
>    sunxi-mali-mainline-driver: bump version
>    sunxi-mali-mainline-driver: add support for building on arm64(aarch64)
>      architecture.
> 
>   .../sunxi-mali-mainline-driver.mk                 |  8 +++++++-
>   package/sunxi-mali-mainline/Config.in             |  6 ++++--
>   .../sunxi-mali-mainline/sunxi-mali-mainline.mk    | 15 ++++++++++-----
>   3 files changed, 21 insertions(+), 8 deletions(-)
> 
