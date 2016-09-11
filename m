From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:28:15 +0200
Subject: [Buildroot] [PATCH v2 2/5] freescale: genimage: Use the common
 genimage template
In-Reply-To: <20160907222912.26002-2-savoundg@gmail.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
 <20160907222912.26002-1-savoundg@gmail.com>
 <20160907222912.26002-2-savoundg@gmail.com>
Message-ID: <20160911232815.357978fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Sep 2016 15:29:09 -0700, Georges Savoundararadj wrote:
> The boards imx6dlsabreauto, imx6dlsabresd, imx6qsabreauto, imx6qsabresd,
> imx6sxsabresd were referring to board/freescale/create-boot-sd.sh for
> the sdcard image generation:
> * Remove board/freescale/create-boot-sd.sh
> * Use the common Freescale genimage template instead.
>   The offset of the first partition was 1MB in the script and is
>   modified to 8MB in the template.
> * Fix the readme.txt file accordingly
> 
> Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - No change

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
