From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:58:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add CPE variables
In-Reply-To: <20210523135723.1521772-1-fontaine.fabrice@gmail.com>
References: <20210523135723.1521772-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523175858.GY3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 15:57 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:opencv:opencv is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopencv%3Aopencv
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opencv3/opencv3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index b1b86ba71d..5c82da9975 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -9,6 +9,8 @@ OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
>  OPENCV3_INSTALL_STAGING = YES
>  OPENCV3_LICENSE = BSD-3-Clause
>  OPENCV3_LICENSE_FILES = LICENSE
> +OPENCV3_CPE_ID_VENDOR = opencv
> +OPENCV3_CPE_ID_PRODUCT = opencv
>  OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
