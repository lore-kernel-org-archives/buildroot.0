From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 09:08:08 +0100
Subject: [Buildroot] [PATCH 3/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-4-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356745553-15362-4-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20121229090808.76c95884@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sat, 29 Dec 2012 03:45:51 +0200, Stefan Fr?berg wrote:
> Cross-compile patch
> URL: http://git.openembedded.org/openembedded-core/plain/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch

Please also put the link in the patch description below.

> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  .../x11r7/mesa3d/mesa3d-0002-cross-compile.patch   |   94 ++++++++++++++++++++
>  1 files changed, 94 insertions(+), 0 deletions(-)
>  create mode 100644 package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch
> 
> diff --git a/package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch b/package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch
> new file mode 100644
> index 0000000..dc8e994
> --- /dev/null
> +++ b/package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch
> @@ -0,0 +1,94 @@
> +cross compile
> +
> +This patch is ported from WindRiver linux and to fix cross compile
> +failure.
> +
> +And original commits are:
> +commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
> +commit 5c4212084b871a0c0fb7d174280ec9a634637deb
> +
> +Upstream-Status: Pending

here.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
