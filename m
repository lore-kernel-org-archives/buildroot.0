From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:25:18 +0200
Subject: [Buildroot] [PATCH v2] configs/toradex_apalis_imx6_defconfig:
 new board
In-Reply-To: <1465994459-6502-1-git-send-email-sergio.prado@e-labworks.com>
References: <1465994459-6502-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160615232518.253276d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Jun 2016 09:40:59 -0300, Sergio Prado wrote:
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
> Changes v1 -> v2:
>   - using $(dirname $0) as board working dir for genimage config file
>   - removing extra "=" signs from readme file
>   - added explanation on how to use uEnv.txt
>   - using BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
> ---
>  board/toradex/apalis-imx6/genimage.cfg  | 15 ++++++++++
>  board/toradex/apalis-imx6/post-image.sh | 20 +++++++++++++
>  board/toradex/apalis-imx6/readme.txt    | 52 +++++++++++++++++++++++++++++++++
>  board/toradex/apalis-imx6/uEnv.txt      |  6 ++++
>  configs/toradex_apalis_imx6_defconfig   | 24 +++++++++++++++
>  5 files changed, 117 insertions(+)
>  create mode 100644 board/toradex/apalis-imx6/genimage.cfg
>  create mode 100755 board/toradex/apalis-imx6/post-image.sh
>  create mode 100644 board/toradex/apalis-imx6/readme.txt
>  create mode 100644 board/toradex/apalis-imx6/uEnv.txt
>  create mode 100644 configs/toradex_apalis_imx6_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
