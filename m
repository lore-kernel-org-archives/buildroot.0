From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Jan 2015 22:55:50 +0100
Subject: [Buildroot] [PATCH] boards/raspberrypi: fix rootfs.tar path in
	readme
In-Reply-To: <1422047108-5486-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1422047108-5486-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150123215550.GE19129@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2015-01-23 16:05 -0500, Vivien Didelot spake thusly:
> The rootfs.tar file is located under ./output/images/.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index 725ad9d..ead9227 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -132,7 +132,7 @@ rootfs, there are further steps to do.
>  Extract (as root!) the contents of the rootfs.tar archive into the second
>  partition you created above:
>  
> -  $ sudo tar xf rootfs.tar -C /mnt/mountpointroot
> +  $ sudo tar xf ./output/images/rootfs.tar -C /mnt/mountpointroot
>  
>  Finish
>  ======
> -- 
> 2.2.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
