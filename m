From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 19:38:44 +0200
Subject: [Buildroot] [PATCH 14/16] eglibc/glibc: add hash file
In-Reply-To: <1413329153-25453-14-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
 <1413329153-25453-14-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019173844.GA12247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-14 20:25 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Manually downloaded and tested all hashes.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.hash | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 package/glibc/glibc.hash
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> new file mode 100644
> index 0000000..094bbda
> --- /dev/null
> +++ b/package/glibc/glibc.hash
> @@ -0,0 +1,8 @@
> +# Locally calculated after checking pgp signature (glibc)
> +# http://downloads.yoctoproject.org/releases/eglibc/*.{md5,sha1} (eglibc)
> +md5	b395b021422a027d89884992e91734fc	eglibc-2.18-svnr23787.tar.bz2
> +sha1	224d9e655e8f0ad04ffde47b97a11c64e2255b56	eglibc-2.18-svnr23787.tar.bz2
> +md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
> +sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
> +sha256	2d3997f588401ea095a0b27227b1d50cdfdd416236f6567b564549d3b46ea2a2	glibc-2.19.tar.xz
> +sha256	f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5	glibc-2.20.tar.xz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/80218e76/attachment.asc>
