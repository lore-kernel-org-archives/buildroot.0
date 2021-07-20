From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:43:03 +0200
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.13.0
In-Reply-To: <20210528073511.16854-1-etienne.carriere@linaro.org>
References: <20210528073511.16854-1-etienne.carriere@linaro.org>
Message-ID: <20210720214303.3cbc4f40@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 28 May 2021 09:35:07 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Bump OP-TEE OS package version to OP-TEE release 3.13.0.
> 
> Add a patch already merged OP-TEE to fix build issue seen with 3.13.0
> on some BR toolchain.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  ...ild-warning-when-_LFS64_LARGEFILE-is.patch | 56 +++++++++++++++++++
>  boot/optee-os/Config.in                       |  4 +-
>  boot/optee-os/optee-os.hash                   |  4 +-
>  3 files changed, 60 insertions(+), 4 deletions(-)
>  create mode 100644 boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
