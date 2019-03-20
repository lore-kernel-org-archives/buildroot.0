From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:34:50 +0100
Subject: [Buildroot] [PATCH v2 1/8] boot/arm-trusted-firmware: support
 32bit Arm targets
In-Reply-To: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190320223450.080ce61a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Mar 2019 00:21:02 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> This change allows one to build the TF-A (Trusted Firmware A) for
> 32bit architectures Armv7 and Armv8 platforms. TF-A supports these
> configuration since release v1.5.
> 
> Change dependency on BR2_aarch64 into a dependency on either
> BR2_ARM_CPU_ARMV8A/BR2_ARM_CPU_ARMV7A to better define
> the target architectures supported by the package.
> 
> Set package configuration directive ARM_ARCH_MAJOR according to
> BR2_ARM_CPU_ARMV8A/BR2_ARM_CPU_ARMV7A. Set package configuration
> directive ARCH based on BR2_aarch64/BR2_arm.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v1 -> v2:
>   - Set ARM_ARCH_MAJOR and ARCH according to Buildroot directives
>     BR2_ARM_CPU_ARMV8A/BR2_ARM_CPU_ARMV7A and BR2_aarch64/BR2_arm.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
