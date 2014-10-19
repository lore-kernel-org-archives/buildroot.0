From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:46:12 +0200
Subject: [Buildroot] [PATCH 10/16] cifs-utils: add hash
In-Reply-To: <1413329153-25453-10-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
 <1413329153-25453-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144612.GP4072@free.fr>
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
>  package/cifs-utils/cifs-utils.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/cifs-utils/cifs-utils.hash
> 
> diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
> new file mode 100644
> index 0000000..9255179
> --- /dev/null
> +++ b/package/cifs-utils/cifs-utils.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	38fc63926af435dae4ebcf4406275580a692d9fb9ee3e32170317cf2ba68e6e3	cifs-utils-6.4.tar.bz2
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/42bb3a5b/attachment.asc>
