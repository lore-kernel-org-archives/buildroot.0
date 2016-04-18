From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Apr 2016 00:10:21 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: document the two consoles (UART+HDMI)
In-Reply-To: <1461015690-31329-1-git-send-email-luca@lucaceresoli.net>
References: <1461015690-31329-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160418221021.GG3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-04-18 23:41 +0200, Luca Ceresoli spake thusly:
> The defconfigs for the Raspberry Pi boards start a console on HDMI in
> addition to the classic one on UART. Document this feature in the
> readme.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/readme.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index b21a75a6ee78..896be2d8a464 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -74,4 +74,6 @@ Copy the bootable "sdcard.img" onto an SD card with "dd":
>    $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>  
>  Insert the SDcard into your Raspberry Pi, and power it up. Your new system
> -should come up now.
> +should come up now and start two consoles: one on the serial port on
> +the P1 header, one on the HDMI output where you can login using a USB
> +keyboard.
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
