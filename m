From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:41:34 +0200
Subject: [Buildroot] [PATCH 3/5] mpfr: add hash file
In-Reply-To: <1413284223-20630-3-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
 <1413284223-20630-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144134.GC4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gustavo, All,

On 2014-10-14 07:57 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested the hash by asking Buildroot to download the package.

Regards,
Yann E. MORIN.

> ---
>  package/mpfr/mpfr.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/mpfr/mpfr.hash
> 
> diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
> new file mode 100644
> index 0000000..ea18780
> --- /dev/null
> +++ b/package/mpfr/mpfr.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	399d0f47ef6608cc01d29ed1b99c7faff36d9994c45f36f41ba250147100453b	mpfr-3.1.2.tar.xz
> -- 
> 2.0.4
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/c9980751/attachment.asc>
