From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 22:12:20 +0200
Subject: [Buildroot] [PATCH 03/11] iptables: add hash
In-Reply-To: <1410963609-18128-3-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
 <1410963609-18128-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917201220.GD4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:20 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

There is also a sha1sum available:
    ftp://ftp.netfilter.org/pub/iptables/iptables-1.4.21.tar.bz2.sha1sum

Since md5 is really so 20th century, it'd be good to use a stronger
hash, especially since upstream provides it.

Regards,
Yann E. MORIN.

> ---
>  package/iptables/iptables.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/iptables/iptables.hash
> 
> diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
> new file mode 100644
> index 0000000..61b9d3d
> --- /dev/null
> +++ b/package/iptables/iptables.hash
> @@ -0,0 +1,2 @@
> +# From http://www.netfilter.org/projects/iptables/downloads.html#iptables-1.4.21
> +md5	536d048c8e8eeebcd9757d0863ebb0c0 	iptables-1.4.21.tar.bz2
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
