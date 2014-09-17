From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:16:50 +0200
Subject: [Buildroot] [PATCH 04/11] util-linux: add hash
In-Reply-To: <1410963609-18128-4-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917201650.GE4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified a download, and verified it is the same as upstream.

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/util-linux.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/util-linux/util-linux.hash
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> new file mode 100644
> index 0000000..cfa1364
> --- /dev/null
> +++ b/package/util-linux/util-linux.hash
> @@ -0,0 +1,2 @@
> +# From https://www.kernel.org/pub/linux/utils/util-linux/v2.25/sha256sums.asc
> +sha256	4701305ae22790c3a92ce48e50794fa05b7ee01f4227f419a171c100d08986e8	util-linux-2.25.1.tar.xz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/3210420a/attachment.asc>
