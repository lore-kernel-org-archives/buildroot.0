From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:03:54 +0100
Subject: [Buildroot] [PATCH] configs/imx28evk: Generate the standard
 sdcard.img
In-Reply-To: <1477923118-9395-1-git-send-email-festevam@gmail.com>
References: <1477923118-9395-1-git-send-email-festevam@gmail.com>
Message-ID: <20161101150354.758991a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 12:11:58 -0200, Fabio Estevam wrote:

> diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
> index cbf6aae..02fde06 100644
> --- a/board/freescale/imx28evk/readme.txt
> +++ b/board/freescale/imx28evk/readme.txt
> @@ -37,7 +37,7 @@ and copy the bootloader, kernel and root filesystem as needed.
>  
>  *** WARNING! The script will destroy all the card content. Use with care! ***

This warning (and the paragraph) above it was still referring to a
"script", but there is not script to run anymore. So I've reworded this
a bit, and applied.

Thanks a lot for having converted this additional board to genimage,
much appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
