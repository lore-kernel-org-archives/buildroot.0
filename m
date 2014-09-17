From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:25:39 +0200
Subject: [Buildroot] [PATCH 07/11] wireless-regdb: add hash
In-Reply-To: <1410963609-18128-7-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917202538.GH4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified against the hash published upstream, and against a dowenload.

Regards,
Yann E. MORIN.

> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/wireless-regdb/wireless-regdb.hash
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> new file mode 100644
> index 0000000..dd9189e
> --- /dev/null
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -0,0 +1,2 @@
> +# From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> +sha256	fbebc9217ff19a3480ec24c61bafd0ba771967d6c895845591b0d231c9ab7dc6	wireless-regdb-2014.06.13.tar.xz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/9cc98a77/attachment.asc>
