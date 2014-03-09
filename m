From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 00:19:02 +0100
Subject: [Buildroot] [PATCH v6 6/6] Makefile: add PATH to the
	USER_HOOKS_EXTRA_ENV
In-Reply-To: <1394373623-10650-7-git-send-email-s.martin49@gmail.com>
References: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
 <1394373623-10650-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20140309231902.GG3194@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-09 15:00 +0100, Samuel Martin spake thusly:
> This can be useful for post-{build,image} scripts, in case some host-tools
> were specifically built to be used by these scripts.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v5 -> v6:
> - add this cset
> ---
>  package/Makefile.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 6817867..693a64e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -278,6 +278,7 @@ HOST_MAKE_ENV=PATH=$(BR_PATH) \
>  # explicitly pass it to user-supplied external hooks (eg. post-build,
>  # post-images)
>  USER_HOOKS_EXTRA_ENV=\
> +	PATH=$(BR_PATH) \
>  	BUILD_DIR=$(BUILD_DIR)
>  
>  ################################################################################
> -- 
> 1.9.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
