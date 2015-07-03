From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2015 20:35:13 +0200
Subject: [Buildroot] [PATCH 2/7] Add rule to build host-libaio
In-Reply-To: <1435929086-21205-3-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1435929086-21205-3-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150703183513.GE3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sylvain, All,

On 2015-07-03 15:11 +0200, Sylvain Raybaud spake thusly:
> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
> ---
>  package/libaio/libaio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
> index 53ad7eb..55e2cc7 100644
> --- a/package/libaio/libaio.mk
> +++ b/package/libaio/libaio.mk
> @@ -24,3 +24,4 @@ define LIBAIO_INSTALL_TARGET_CMDS
>  endef
>  
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))

You need to explain in the commit log why you need the host variant.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
