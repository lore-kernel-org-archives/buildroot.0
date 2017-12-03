From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:33:20 +0100
Subject: [Buildroot] [PATCH 3/3] orangepi-pc-plus: enable WiFi support
In-Reply-To: <20171108194334.10031-4-geomatsi@gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
 <20171108194334.10031-4-geomatsi@gmail.com>
Message-ID: <20171203233320.4052a499@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 22:43:34 +0300, Sergey Matyukevich wrote:
> Make WiFi work out of the box on orangepi-pc-plus:
>   - add rtl8xx firmware
>   - add rtl8189fs driver
>   - add mdev for module autoloading
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  configs/orangepi_pc_plus_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
