From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 09:07:29 +0100
Subject: [Buildroot] [PATCH 2/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-3-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356745553-15362-3-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20121229090729.16270e5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sat, 29 Dec 2012 03:45:50 +0200, Stefan Fr?berg wrote:
> Updated and renamed version of mesa3d-uclibc-locale.patch for Mesa 8.0.5
> URL: http://git.openembedded.org/openembedded-core/plain/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch

Please also put this link...

> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  .../mesa3d/mesa3d-0001-Compile-with-uclibc.patch   |   52 ++++++++++++++++++++
>  1 files changed, 52 insertions(+), 0 deletions(-)
>  create mode 100644 package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
> 
> diff --git a/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch b/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
> new file mode 100644
> index 0000000..d39270a
> --- /dev/null
> +++ b/package/x11r7/mesa3d/mesa3d-0001-Compile-with-uclibc.patch
> @@ -0,0 +1,52 @@
> +Compile with uclibc
> +
> +Upstream-Status: Pending

...here.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
