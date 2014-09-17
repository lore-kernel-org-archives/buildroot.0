From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:48:32 +0200
Subject: [Buildroot] [PATCH 10/11] iproute2: add hash
In-Reply-To: <1410963609-18128-10-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917204832.GA25761@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified against the hash published by upstream, and against a download.

Regards,
Yann E. MORIN.

> ---
>  package/iproute2/iproute2.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/iproute2/iproute2.hash
> 
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> new file mode 100644
> index 0000000..5a8e6ca
> --- /dev/null
> +++ b/package/iproute2/iproute2.hash
> @@ -0,0 +1,2 @@
> +# From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> +sha256	1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79	iproute2-3.16.0.tar.xz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/d9701e51/attachment.asc>
