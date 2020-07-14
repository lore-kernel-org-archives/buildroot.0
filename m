From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:37:10 +0200
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.9.0
In-Reply-To: <20200529142742.9381-1-etienne.carriere@linaro.org>
References: <20200529142742.9381-1-etienne.carriere@linaro.org>
Message-ID: <20200714153710.513e7c16@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 May 2020 16:27:38 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Bump OP-TEE OS package version to OP-TEE release 3.9.0.
> 
> Update patch on pydrypto/pycryptodome to match 3.9.0.
> Add patch on CFG_OPTEE_REVISION_MINOR that was not updated in release
> 3.9.0 and fixed only few commits above.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  ...ub.py-use-Cryptodome-module-instead-.patch | 34 ++++++++++
>  ...o_pub_c.py-sign.py-use-pycryptodomex.patch | 64 -------------------
>  ...nfig.mk-fix-CFG_OPTEE_REVISION_MINOR.patch | 32 ++++++++++
>  boot/optee-os/Config.in                       |  4 +-
>  boot/optee-os/optee-os.hash                   |  4 +-
>  5 files changed, 70 insertions(+), 68 deletions(-)
>  create mode 100644 boot/optee-os/0001-scripts-pem_to_pub.py-use-Cryptodome-module-instead-.patch
>  delete mode 100644 boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch
>  create mode 100644 boot/optee-os/0002-config.mk-fix-CFG_OPTEE_REVISION_MINOR.patch

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
