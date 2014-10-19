From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:42:04 +0200
Subject: [Buildroot] [PATCH 5/5] mpc: add hash file
In-Reply-To: <1413284223-20630-5-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
 <1413284223-20630-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144204.GE4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-14 07:57 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested the hash by asking Buildroot to download the package.

Regards,
Yann E. MORIN.

> ---
>  package/mpc/mpc.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/mpc/mpc.hash
> 
> diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
> new file mode 100644
> index 0000000..bee59fe
> --- /dev/null
> +++ b/package/mpc/mpc.hash
> @@ -0,0 +1,2 @@
> +# From http://www.multiprecision.org/index.php?prog=mpc&page=download
> +sha1	5072d82ab50ec36cc8c0e320b5c377adb48abe70	mpc-1.0.2.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/65cb57d3/attachment.asc>
