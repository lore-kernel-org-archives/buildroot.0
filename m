From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:27:52 +0200
Subject: [Buildroot] [PATCH 08/11] openssl: add hash
In-Reply-To: <1410963609-18128-8-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917202752.GI4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified against both ahshes published by upstream, and against a
download.

Regards,
Yann E. MORIN.

> ---
>  package/openssl/openssl.hash | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 package/openssl/openssl.hash
> 
> diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
> new file mode 100644
> index 0000000..aa45a76
> --- /dev/null
> +++ b/package/openssl/openssl.hash
> @@ -0,0 +1,4 @@
> +# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.md5
> +# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.sha1
> +md5	c8dc151a671b9b92ff3e4c118b174972	openssl-1.0.1i.tar.gz
> +sha1	74eed314fa2c93006df8d26cd9fc630a101abd76	openssl-1.0.1i.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/a45d9fde/attachment.asc>
