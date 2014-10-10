From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 15:39:57 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: modify kernel location to
 /boot/zImage
In-Reply-To: <1412931929-22989-1-git-send-email-alvaro.gamez@hazent.com>
References: <1412931929-22989-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20141010153957.0cbbb922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Fri, 10 Oct 2014 11:05:29 +0200, Alvaro G. M wrote:
> This is the location where buildroot install the image if requested,
> so this should be the default search path for the bootloader.
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  boot/grub2/grub.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
