From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:58:40 +0200
Subject: [Buildroot] [PATCH 1/4] imx-kobs: switch to open source version
In-Reply-To: <20161019142309.15628-2-gary.bisson@boundarydevices.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
 <20161019142309.15628-2-gary.bisson@boundarydevices.com>
Message-ID: <20161019175840.35974345@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 16:23:06 +0200, Gary Bisson wrote:
> The tools "kobs-ng" will be maintained as a open source project.
> The repository location is https://github.com/NXPmicro/imx-kobs
> 
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-freescale/commit/c23736b3
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
>  package/freescale-imx/imx-kobs/imx-kobs.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Patches 1 to 3 applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
