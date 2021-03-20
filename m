From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 23:05:59 +0100
Subject: [Buildroot] [PATCH 8/8] configs/qemu_arm_vexpress_tz_defconfig:
 embed openssl library
In-Reply-To: <20201030075045.6960-8-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
 <20201030075045.6960-8-etienne.carriere@linaro.org>
Message-ID: <20210320230559.747fd519@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Oct 2020 08:50:45 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Embed openssl library to enable some OP-TEE tests that relies on it.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  configs/qemu_arm_vexpress_tz_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
