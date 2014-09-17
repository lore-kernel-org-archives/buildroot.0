From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:56:01 +0200
Subject: [Buildroot] [PATCHv2] iptables: add hash
In-Reply-To: <1410985090-7574-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410985090-7574-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917205601.GD25761@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 17:18 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Verified against a download.

Regards,
Yann E. MORIN.

> ---
>  package/iptables/iptables.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/iptables/iptables.hash
> 
> diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
> new file mode 100644
> index 0000000..a813f74
> --- /dev/null
> +++ b/package/iptables/iptables.hash
> @@ -0,0 +1,3 @@
> +# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.4.21.tar.bz2.{md5sum,sha1sum}
> +md5	536d048c8e8eeebcd9757d0863ebb0c0 	iptables-1.4.21.tar.bz2
> +sha1	85d4160537546a23a7e42bc26dd7ee62a0ede4c8	iptables-1.4.21.tar.bz2
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/789ffabe/attachment.asc>
