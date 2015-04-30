From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 30 Apr 2015 09:36:14 -0500
Subject: [Buildroot] [PATCH 8/8] configs: rename atmel_xplained_defconfig
In-Reply-To: <1430398311-10804-9-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1430398311-10804-9-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAMQcK5Lb5fGQ1TuiAEG7vV+nhV8KX_vYxHn81wTKDGyWp+A7PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre,

On Thu, Apr 30, 2015 at 7:51 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> For consistency, rename atmel_xplained_defconfig to
> atmel_sama5d3_xplained_mmc_defconfig as this configuration supports
> booting the sama5d3 Xplained with an MMC card (as opposed to the NAND
> flash).
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  .../{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig}    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename configs/{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig} (100%)

I believe the readme.txt under board/atmel/xplained should be updated
to say atmel_sama5d3_xplained_mmc_defconfig instead of
atmel_xplained_defconfig.

Thanks
-Ryan

>
> diff --git a/configs/atmel_xplained_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
> similarity index 100%
> rename from configs/atmel_xplained_defconfig
> rename to configs/atmel_sama5d3_xplained_mmc_defconfig



-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
