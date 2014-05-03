From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 May 2014 23:31:49 +0200
Subject: [Buildroot] [PATCH v2 08/24] opencv: add license details
In-Reply-To: <1398208556-4195-9-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-9-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503213149.GB13170@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - new patch (splitting suggested by Yann)
> ---
>  package/opencv/opencv.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 10f11cf..a4d2ee0 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -7,6 +7,8 @@
>  OPENCV_VERSION = 2.4.8
>  OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
>  OPENCV_INSTALL_STAGING = YES
> +OPENCV_LICENSE = BSD-3c
> +OPENCV_LICENSE_FILES = doc/license.txt
>  
>  OPENCV_CONF_OPT += \
>  	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
> -- 
> 1.9.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
