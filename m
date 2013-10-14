From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 18:39:22 +0200
Subject: [Buildroot] [PATCH 1/3] libevent: add host variant
In-Reply-To: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131014183922.75e02953@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Oct 2013 11:15:09 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libevent/libevent.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index a6def1a..14ebf72 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -20,3 +20,4 @@ LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Why?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
