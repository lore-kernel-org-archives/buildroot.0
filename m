From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 14:35:11 +0100
Subject: [Buildroot] [PATCH/next v1 1/2] configs/raspberrypi*: bump
 kernel version to 5eeff139ea
In-Reply-To: <20190223103258.4274-2-ps.report@gmx.net>
References: <20190223103258.4274-1-ps.report@gmx.net>
 <20190223103258.4274-2-ps.report@gmx.net>
Message-ID: <20190223143511.60e6d0d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sat, 23 Feb 2019 11:32:57 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Now based on 4.19.23 (from 4.14.98) and bump linux header
> version accordingly and needs host openssl.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  configs/raspberrypi0_defconfig       | 8 +++++---
>  configs/raspberrypi0w_defconfig      | 7 ++++---
>  configs/raspberrypi2_defconfig       | 8 +++++---
>  configs/raspberrypi3_64_defconfig    | 8 +++++---
>  configs/raspberrypi3_defconfig       | 6 ++++--
>  configs/raspberrypi3_qt5we_defconfig | 8 +++++---
>  configs/raspberrypi_defconfig        | 8 +++++---
>  7 files changed, 33 insertions(+), 20 deletions(-)

This patch applies neither on master nor on next. Could you rebase on
next ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
