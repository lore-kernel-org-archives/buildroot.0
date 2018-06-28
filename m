From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:21:43 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external-linaro-aarch64-be:
 new package
In-Reply-To: <1530170663-2950-1-git-send-email-oferh@marvell.com>
References: <1530170663-2950-1-git-send-email-oferh@marvell.com>
Message-ID: <20180628222143.198fe7e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 10:24:22 +0300, oferh at marvell.com wrote:
> From: Ofer Heifetz <oferh@marvell.com>
> 
> This commit adds a new package for the Linaro external toolchain for
> the AArch64 Big Endian architecture.
> 
> https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05
> 
> Signed-off-by: Ofer Heifetz <oferh@marvell.com>
> ---
>  toolchain/toolchain-external/Config.in                   |  6 ++++++
>  .../toolchain-external-linaro-aarch64-be/Config.in       | 15 +++++++++++++++
>  .../Config.in.options                                    |  9 +++++++++
>  .../toolchain-external-linaro-aarch64-be.hash            |  3 +++
>  .../toolchain-external-linaro-aarch64-be.mk              | 16 ++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
>  create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
>  create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
>  create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk

Thanks for this contribution. I've applied both patches!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
