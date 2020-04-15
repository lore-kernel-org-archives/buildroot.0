From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 23:07:53 +0200
Subject: [Buildroot] [PATCH 1/2] configs/solidrun_macchiatobin_mainline:
 bump bsp versions
In-Reply-To: <20200415134136.580543-2-geomatsi@gmail.com>
References: <20200415134136.580543-1-geomatsi@gmail.com>
 <20200415134136.580543-2-geomatsi@gmail.com>
Message-ID: <20200415230753.1c02ad80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 16:41:35 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Bump Linux to 5.6.3, U-Boot to 2020.01. New kernel and modules based
> on arm64 defconfig do not fit into default size filesystem anymore.
> So increase filesystem size to 120M.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  configs/solidrun_macchiatobin_mainline_defconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks. It would be good to see of upstream ATF
could be used instead of the Marvell-specific version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
