From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:43:03 +0200
Subject: [Buildroot] [PATCH 01/16] uclibc: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144303.GG4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-14 20:25 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested the 0.9.33.2 hash by asking Buildroot to download the package.

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/uclibc.hash | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 package/uclibc/uclibc.hash
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> new file mode 100644
> index 0000000..0fba41a
> --- /dev/null
> +++ b/package/uclibc/uclibc.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated after checking pgp signature (vanilla)
> +# Locally calculated (ARC)
> +sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
> +sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/80c9fd12/attachment.asc>
