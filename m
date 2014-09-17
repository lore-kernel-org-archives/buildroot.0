From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:19:24 +0200
Subject: [Buildroot] [PATCH 05/11] iw: add hash
In-Reply-To: <1410963609-18128-5-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917201924.GF4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified against hash published by upstream, and against a download

Regards,
Yann E. MORIN.

> ---
>  package/iw/iw.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/iw/iw.hash
> 
> diff --git a/package/iw/iw.hash b/package/iw/iw.hash
> new file mode 100644
> index 0000000..a635646
> --- /dev/null
> +++ b/package/iw/iw.hash
> @@ -0,0 +1,2 @@
> +# From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
> +sha256	bd5c0a92cea799e22bcf431dfe0f91a3ba293ce078e9d95e53d7dbb26df24b8a	iw-3.15.tar.xz
> -- 
> 1.8.5.5
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/d041e75b/attachment.asc>
