From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 21:59:54 +0200
Subject: [Buildroot] [PATCH 02/11] polarssl: add hash
In-Reply-To: <1410963609-18128-2-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917195954.GC4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified that the hashes are correct, and also the same as published on
the website.

Regards,
Yann E. MORIN.

> ---
>  package/polarssl/polarssl.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/polarssl/polarssl.hash
> 
> diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
> new file mode 100644
> index 0000000..ca437ac
> --- /dev/null
> +++ b/package/polarssl/polarssl.hash
> @@ -0,0 +1,3 @@
> +# From https://polarssl.org/tech-updates/releases/polarssl-1.2.11-released
> +sha1	40cb3a833245273946c2075e6c948bbcda8a1be9	polarssl-1.2.11-gpl.tgz
> +sha256	b3e9d059c687980976b468d8260f658e9003aede1dbc4a918526e90abdaa7d75	polarssl-1.2.11-gpl.tgz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/4a19deca/attachment.asc>
