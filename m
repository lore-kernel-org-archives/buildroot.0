From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 18:19:47 +0200
Subject: [Buildroot] [PATCH v4 6/7] package/optee-examples: bump version
 to 3.5.0
In-Reply-To: <20190514085319.9031-6-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
 <20190514085319.9031-6-etienne.carriere@linaro.org>
Message-ID: <20190514181947.365997c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 10:53:18 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Bump OP-TEE Examples package version to release 3.5.0.
> This change discard now useless patches on OP-TEE Examples
> package.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v3 -> v4:
> - No change
> Changes v2 -> v3:
> - Fix on commit message: s/OP-TEE OS/OP-TEE Examples/.
> Changes v1 -> v2:
> - No change
> ---
>  ...-fix-deprecated-size_t-type-for-size.patch | 42 -------------------
>  package/optee-examples/optee-examples.hash    |  4 +-
>  package/optee-examples/optee-examples.mk      |  2 +-
>  3 files changed, 3 insertions(+), 45 deletions(-)
>  delete mode 100644 package/optee-examples/0001-fix-deprecated-size_t-type-for-size.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
