From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:19:07 +0200
Subject: [Buildroot] [PATCH v2 03/14] kernel-module-imx-gpu-viv: bump
 version to that of the 5.0.11.p8.4 release
In-Reply-To: <0488cfbbe0603e8dbae57f3115420c174fd6e38b.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <0488cfbbe0603e8dbae57f3115420c174fd6e38b.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-ys6ngnXYoimvwzVom32qKhXn03f3aVGDBWyPGm8fQ+oJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:09 PM, Andrew Webster <awebster@arcx.com> wrote:
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/c9c30c5
>
> This package has been tested with the following commands with the
> matching imx-gpu-viv library:
>  # modprobe galcore
>  # cd /usr/share/examples/viv_samples/vdk/
>  # ./tutorial7
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
