From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:19:32 +0200
Subject: [Buildroot] [PATCH v4 4/7] package/optee-client: bump version
 to 3.5.0
In-Reply-To: <20190514085319.9031-4-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
 <20190514085319.9031-4-etienne.carriere@linaro.org>
Message-ID: <20190514181932.7269ab48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 10:53:16 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Bump OP-TEE Client package version to release 3.5.0.
> This change discard now useless patches on OP-TEE Client
> package.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v3 -> v4:
> - No change
> Changes v2 -> v3:
> - Fix on commit message: s/OP-TEE OS/OP-TEE Client/.
> Changes v1 -> v2:
> - No change
> ---
>  ...-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch |  52 -------
>  .../0002-libteec-fix-build-warnings.patch     | 128 ------------------
>  .../0003-libteec-fix-clang-build-errors.patch |  64 ---------
>  package/optee-client/optee-client.hash        |   4 +-
>  package/optee-client/optee-client.mk          |   2 +-
>  5 files changed, 3 insertions(+), 247 deletions(-)
>  delete mode 100644 package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
>  delete mode 100644 package/optee-client/0002-libteec-fix-build-warnings.patch
>  delete mode 100644 package/optee-client/0003-libteec-fix-clang-build-errors.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
