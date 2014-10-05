From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 12:09:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/swig: define SWIG pointing to
 the host swig program
In-Reply-To: <1412502007-9902-1-git-send-email-s.martin49@gmail.com>
References: <1412502007-9902-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141005100921.GF4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-10-05 11:40 +0200, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/swig/swig.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index 9996e95..3ef56d6 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -31,3 +31,5 @@ endef
>  HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
>  
>  $(eval $(host-autotools-package))
> +
> +SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
> -- 
> 2.1.2
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
