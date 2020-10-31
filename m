From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:59:19 +0100
Subject: [Buildroot] [PATCH 1/8] configs/qemu_arm_vexpress_tz_defconfig:
 enable CXX toolchain
In-Reply-To: <20201030075045.6960-1-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
Message-ID: <20201031225919.7c5d974a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Oct 2020 08:50:38 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Enable C++ toolchain that is needed to build some OP-TEE test
> trusted applications once OP-TEE packages bump to release 3.11.0.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  configs/qemu_arm_vexpress_tz_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Thanks, I have applied patches 1 to 6 in this series. I have asked a
question on PATCH 7/8 though, so I haven't applied 7/8 and 8/8.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
