From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 23:28:33 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix Config.in option that
 cargo packages must depend on
In-Reply-To: <20191005214511.25905-1-thomas.petazzoni@bootlin.com>
References: <20191005214511.25905-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191010232833.45dd7e40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 23:45:10 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Back in commit 025b863e6facb7b219b82ee6ee7a7916c2c3c47e, the option
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was introduced, to
> separate the option that host packages needing Rust should depend on
> (BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS) from the option that target
> packages needing Rust should depend on
> (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).
> 
> Since the example in the manual is showing a target package, we must
> use BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Sam Voss <sam.voss@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  docs/manual/adding-packages-cargo.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
