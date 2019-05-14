From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:19:38 +0200
Subject: [Buildroot] [PATCH v4 5/7] package/optee-test: bump version to
 3.5.0
In-Reply-To: <20190514085319.9031-5-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
 <20190514085319.9031-5-etienne.carriere@linaro.org>
Message-ID: <20190514181938.36aefc27@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 10:53:17 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Bump OP-TEE Test package version to release 3.5.0. This
> change updates patches on OP-TEE Test package accordingly.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v3 -> v4:
> - No change
> Changes v2 -> v3:
> - Fix on commit message: s/OP-TEE OS/OP-TEE Test/.
> Changes v1 -> v2:
> - No change
> ---
>  ...n-4100-update-string-conversion-loop.patch | 72 -------------------
>  ...prevent-unsafe-loop-optimizations-bu.patch | 63 ++++++++++++++++
>  package/optee-test/optee-test.hash            |  4 +-
>  package/optee-test/optee-test.mk              |  2 +-
>  4 files changed, 66 insertions(+), 75 deletions(-)
>  delete mode 100644 package/optee-test/0001-regression-4100-update-string-conversion-loop.patch
>  create mode 100644 package/optee-test/0001-regression-41xx-prevent-unsafe-loop-optimizations-bu.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
