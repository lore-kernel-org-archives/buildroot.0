From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 22:53:08 +0200
Subject: [Buildroot] [PATCH 1/2] libevdev: bump to 1.2.2
In-Reply-To: <1406839593-32462-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406839593-32462-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140731205308.GH3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-31 22:46 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libevdev/libevdev.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
> index f4570bc..738af92 100644
> --- a/package/libevdev/libevdev.mk
> +++ b/package/libevdev/libevdev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBEVDEV_VERSION = 1.2.1
> +LIBEVDEV_VERSION = 1.2.2
>  LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
>  LIBEVDEV_LICENSE = X11
>  LIBEVDEV_LICENSE_FILES = COPYING
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
