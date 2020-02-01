From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 22:53:59 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/meson: bump to version 0.53.1
In-Reply-To: <20200125234526.49517-1-james.hilliard1@gmail.com>
References: <20200125234526.49517-1-james.hilliard1@gmail.com>
Message-ID: <20200201225359.773cabd7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jan 2020 16:45:26 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Removed patch that is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> ---
> Changes v3 -> v4:
>   - bump to 0.53.1 which includes gcc linker fix
> Changes v2 -> v3:
>   - backport upstream fix from commit instead of pull request
> Changes v1 -> v2:
>   - add patch to prevent passing an invalid linker to gcc
> ---
>  ...ic-libs-when-default-library-static.patch} |  0
>  ...dist.py-import-lzma-only-when-needed.patch | 50 -------------------
>  package/meson/meson.hash                      |  4 +-
>  package/meson/meson.mk                        |  2 +-
>  4 files changed, 3 insertions(+), 53 deletions(-)
>  rename package/meson/{0003-Prefer-ext-static-libs-when-default-library-static.patch => 0002-Prefer-ext-static-libs-when-default-library-static.patch} (100%)
>  delete mode 100644 package/meson/0002-mdist.py-import-lzma-only-when-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
