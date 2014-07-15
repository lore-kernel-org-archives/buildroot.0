From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:16:35 +0200
Subject: [Buildroot] [PATCH] nitrogen6x: include .dtb files for
 compatible variants
In-Reply-To: <1405012684-30163-1-git-send-email-eric.nelson@boundarydevices.com>
References: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>
 <1405012684-30163-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20140715231635.44053b68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Thu, 10 Jul 2014 10:18:04 -0700, Eric Nelson wrote:
> The Boundary Devices Nitrogen6X comes in a number of variants
> with different processors, and the kernel and userspace is
> compatible with the SABRE Lite (BD-SL-i.MX6), Nitrogen6_Lite,
> and Nitrogen6_Max boards.
> 
> This patch adds support for these boards through the
> corresponding .dtb files.
> 
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> ---
>  configs/nitrogen6x_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. The issues raised in the discussion (adding the build
of a bootloader) can be handled in followup patches. Contributions
welcome.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
