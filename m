From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:34:43 +0200
Subject: [Buildroot] [PATCH 09/10] imx-lib: bump version to 5.4
In-Reply-To: <7cd0c667d759ea496e55a9cfd2409dbf39e1772e.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <7cd0c667d759ea496e55a9cfd2409dbf39e1772e.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-yu1k6S6rpRTrTemfgbRkzRCcS6YwO2qT6fUK6P3h=o3uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:12 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> - Remove platform check in hdmi-cec and imx-lib - simplify to support builds
> on multiple machines
> - For ipu use the dummy defaul object to fix build issues on non-ipu hardware
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/7946533
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
