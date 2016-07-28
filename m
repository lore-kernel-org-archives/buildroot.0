From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:44:58 -0500
Subject: [Buildroot] [PATCH 4/7] zynq_microzed: bump U-Boot to
	xilinx-v2016.2
In-Reply-To: <1468834703-27518-5-git-send-email-yamada.masahiro@socionext.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-5-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <CANQCQpY4LprJfXFTvCpBJ5skJtzpPeLhYWSzwG1GzkqpAv6HnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 18, 2016 at 4:38 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This is the latest release tag in the Xilinx repository, based on
> U-Boot v2016.01 in the mainline.  To sync with the Zedboard updates,
> switch over to the Xilinx GitHub repository.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  board/avnet/microzed/readme.txt                    | 53 ++++------------------
>  ...eate-microzed-specific-U-Boot-environment.patch | 41 -----------------
>  configs/zynq_microzed_defconfig                    | 10 ++--
>  3 files changed, 14 insertions(+), 90 deletions(-)
>  delete mode 100644 board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
>
<snip>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
