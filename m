From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:32:59 +0100
Subject: [Buildroot] [PATCHv2] toolchain-external: update Arm AArch64 BE
 toolchain 9.2-2019.12
In-Reply-To: <20200107213014.7477-1-romain.naour@gmail.com>
References: <20200107213014.7477-1-romain.naour@gmail.com>
Message-ID: <20200108093259.1d35df28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Jan 2020 22:30:14 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Update to gcc 9.2.1, gdb 8.3.0, binutils 2.33.1.
> 
> The download url has been fixed:
> https://bugs.linaro.org/show_bug.cgi?id=5529
> 
> See "Release Note":
> https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: wait for upstream url fix
>     fix hash
>     
>  .../toolchain-external-arm-aarch64-be/Config.in             | 6 +++---
>  .../toolchain-external-arm-aarch64-be/Config.in.options     | 2 +-
>  .../toolchain-external-arm-aarch64-be.hash                  | 6 +++---
>  .../toolchain-external-arm-aarch64-be.mk                    | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
