From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:44:26 +0200
Subject: [Buildroot] [PATCH 05/16] libidn: add hash file
In-Reply-To: <1413329153-25453-5-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
 <1413329153-25453-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144426.GK4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-14 20:25 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested the hash by asking Buildroot to download the package.

Regards,
Yann E. MORIN.

> ---
>  package/libidn/libidn.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/libidn/libidn.hash
> 
> diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
> new file mode 100644
> index 0000000..f486626
> --- /dev/null
> +++ b/package/libidn/libidn.hash
> @@ -0,0 +1,2 @@
> +# From https://lists.gnu.org/archive/html/info-gnu/2014-08/msg00006.html
> +sha256	fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c	libidn-1.29.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/0123cff6/attachment.asc>
