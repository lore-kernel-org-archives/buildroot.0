From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2015 23:43:19 +0200
Subject: [Buildroot] [PATCH] package/b43-firmware: add missing hash for
 pre 3.2 kernel archive
In-Reply-To: <1429564785-11856-1-git-send-email-romain.naour@openwide.fr>
References: <1429564785-11856-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150420214319.GD4057@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-04-20 23:19 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Manually verified the hash.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/b43-firmware/b43-firmware.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/b43-firmware/b43-firmware.hash b/package/b43-firmware/b43-firmware.hash
> index bafd00c..efc1a6c 100644
> --- a/package/b43-firmware/b43-firmware.hash
> +++ b/package/b43-firmware/b43-firmware.hash
> @@ -1,2 +1,3 @@
>  # Locally computed:
>  sha256 f1e7067aac5b62b67b8b6e4c517990277804339ac16065eb13c731ff909ae46f broadcom-wl-5.100.138.tar.bz2
> +sha256 26a8c370f48fc129d0731cfd751c36cae1419b0bc8ca35781126744e60eae009 broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
> -- 
> 1.9.3
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150420/e43236a7/attachment.asc>
