From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:45:06 +0200
Subject: [Buildroot] [PATCH 07/16] pptp-linux: add hash file
In-Reply-To: <1413329153-25453-7-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
 <1413329153-25453-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144506.GM4072@free.fr>
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
>  package/pptp-linux/pptp-linux.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/pptp-linux/pptp-linux.hash
> 
> diff --git a/package/pptp-linux/pptp-linux.hash b/package/pptp-linux/pptp-linux.hash
> new file mode 100644
> index 0000000..839d0bf
> --- /dev/null
> +++ b/package/pptp-linux/pptp-linux.hash
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.8.0/
> +md5	4efce9f263e2c3f38d79d9df222476de	pptp-1.8.0.tar.gz
> +sha1	6289953812ac986c7234e83aefb10b5e279dc613	pptp-1.8.0.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/8acb5223/attachment.asc>
