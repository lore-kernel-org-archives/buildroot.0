From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 21:46:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix typo in
 OPENCV_WARNINGS_ARE_ERRORS
In-Reply-To: <20201018134732.960533-1-fontaine.fabrice@gmail.com>
References: <20201018134732.960533-1-fontaine.fabrice@gmail.com>
Message-ID: <20201018194610.GE3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-18 15:47 +0200, Fabrice Fontaine spake thusly:
> OPENCV3_WARNINGS_ARE_ERRORS option does not exist so rename it to
> OPENCV_WARNINGS_ARE_ERRORS (even if it is already disabled by default)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opencv3/opencv3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 648cc66af3..c67387e114 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -53,7 +53,7 @@ OPENCV3_CONF_OPTS += \
>  	-DENABLE_OMIT_FRAME_POINTER=ON \
>  	-DENABLE_PRECOMPILED_HEADERS=OFF \
>  	-DENABLE_PROFILING=OFF \
> -	-DOPENCV3_WARNINGS_ARE_ERRORS=OFF
> +	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
>  
>  # OpenCV link options
>  OPENCV3_CONF_OPTS += \
> -- 
> 2.28.0
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
