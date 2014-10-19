From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:40:12 +0200
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: add hash
In-Reply-To: <1413284160-20587-2-git-send-email-gustavo@zacarias.com.ar>
References: <1413284160-20587-1-git-send-email-gustavo@zacarias.com.ar>
 <1413284160-20587-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144012.GZ4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-14 07:56 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested the hash by asking Buildroot to download the package.

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/wpa_supplicant.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/wpa_supplicant/wpa_supplicant.hash
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
> new file mode 100644
> index 0000000..947ae23
> --- /dev/null
> +++ b/package/wpa_supplicant/wpa_supplicant.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a	wpa_supplicant-2.3.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/dbafe1b5/attachment.asc>
