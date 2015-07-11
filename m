From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:31:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/linux-firmware: add missing
 nvs file for the wl18xx firmware
In-Reply-To: <1436401523-7916-1-git-send-email-mac@vrvana.com>
References: <1436401523-7916-1-git-send-email-mac@vrvana.com>
Message-ID: <20150711093137.3b560c94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marc-Andre Chenier,

On Wed, 8 Jul 2015 20:25:23 -0400, Marc-Andre Chenier wrote:
> The wl18xx shares the same wlcore as the wl1271 and needs the 
> wl1271-nvs.bin file.  Also, refactor some comments and list items.
> 
> Signed-off-by: Marc-Andre Chenier <mac@vrvana.com>
> ---
>  Changes v1 -> v2:
>    - put symbolic link comment before list (suggested by Yann E. Morin)
>    - move symbolic link into list (suggested by Yann E. Morin)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
