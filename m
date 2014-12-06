From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 11:58:41 +0100
Subject: [Buildroot] [PATCH 3/3] fconfig: add hash file
In-Reply-To: <1417859787-31970-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417859787-31970-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141206105841.GC3938@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-06 10:56 +0100, Thomas Petazzoni spake thusly:
> Add locally computed hash file for fconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Manually verified with a locally cached archive of fconfig.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/fconfig/fconfig.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/fconfig/fconfig.hash
> 
> diff --git a/package/fconfig/fconfig.hash b/package/fconfig/fconfig.hash
> new file mode 100644
> index 0000000..eae26e2
> --- /dev/null
> +++ b/package/fconfig/fconfig.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7 fconfig-20080329.tar.gz
> -- 
> 2.1.0
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141206/70def155/attachment.asc>
