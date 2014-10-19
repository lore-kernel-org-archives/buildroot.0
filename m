From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:41:13 +0200
Subject: [Buildroot] [PATCH 2/5] pppd: add hash file
In-Reply-To: <1413284223-20630-2-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
 <1413284223-20630-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144113.GB4072@free.fr>
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
>  package/pppd/pppd.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/pppd/pppd.hash
> 
> diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
> new file mode 100644
> index 0000000..2bc248d
> --- /dev/null
> +++ b/package/pppd/pppd.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30	ppp-2.4.7.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/c4e53c62/attachment.asc>
