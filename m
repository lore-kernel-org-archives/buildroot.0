From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Oct 2014 16:53:23 -0700
Subject: [Buildroot] [PATCH 1/2] skeleton: ld.so.conf include
 ld.so.conf.d/*.conf
In-Reply-To: <1413186949-7006-1-git-send-email-jezz@sysmic.org>
References: <1413186949-7006-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141024235323.GE14818@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-10-13 09:55 +0200, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Given the feedback given in the thread, I've marked this patch "Changes
Requested" in patchwork.

Are you working on an updated patch?

Regards,
Yann E. MORIN.

> ---
>  system/skeleton/etc/ld.so.conf | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 system/skeleton/etc/ld.so.conf
> 
> diff --git a/system/skeleton/etc/ld.so.conf b/system/skeleton/etc/ld.so.conf
> new file mode 100644
> index 0000000..83327c0
> --- /dev/null
> +++ b/system/skeleton/etc/ld.so.conf
> @@ -0,0 +1 @@
> +include /etc/ld.so.conf.d/*.conf
> -- 
> 1.9.1
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
