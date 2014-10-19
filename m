From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 16:47:11 +0200
Subject: [Buildroot] [PATCH 13/16] bridge-utils: add hash file
In-Reply-To: <1413329153-25453-13-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
 <1413329153-25453-13-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141019144711.GS4072@free.fr>
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
>  package/bridge-utils/bridge-utils.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/bridge-utils/bridge-utils.hash
> 
> diff --git a/package/bridge-utils/bridge-utils.hash b/package/bridge-utils/bridge-utils.hash
> new file mode 100644
> index 0000000..c85fd04
> --- /dev/null
> +++ b/package/bridge-utils/bridge-utils.hash
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/bridge/files/bridge/
> +md5	ec7b381160b340648dede58c31bb2238	bridge-utils-1.5.tar.gz
> +sha1	19d2a58cd3a70f971aa931b40256174a847e60d6	bridge-utils-1.5.tar.gz
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141019/7399dc6e/attachment.asc>
