From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:29:23 +0200
Subject: [Buildroot] [PATCH] configs: Rename engicam_isiot_mmc_defconfig
In-Reply-To: <1498833174-16889-1-git-send-email-jteki@openedev.com>
References: <1498833174-16889-1-git-send-email-jteki@openedev.com>
Message-ID: <20170701102923.4ba45eb6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 20:02:54 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> _mmc on defconfig files in engicam need to drop and
> same follow on other engicam defconfig files.
> 
> So, this patch rename engicam_imx6ul_isiot_mmc_defconfig
> to engicam_imx6ul_isiot_defconfig which is missing in
> below commit
> "board: Add support for Engicam Is.IoT MX6UL SOM"
> (sha1: 0235bc61766bd0d4fecfbd686cd807992ba5f37d)
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  ...{engicam_imx6ul_isiot_mmc_defconfig => engicam_imx6ul_isiot_defconfig} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename configs/{engicam_imx6ul_isiot_mmc_defconfig => engicam_imx6ul_isiot_defconfig} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
