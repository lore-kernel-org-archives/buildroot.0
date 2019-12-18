From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 22:05:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/tftpd: add an upstream URL to
 Config.in
In-Reply-To: <20191218133717.28343-1-mark@dibsco.co.uk>
References: <20191218133717.28343-1-mark@dibsco.co.uk>
Message-ID: <20191218210555.GD26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-12-18 13:37 +0000, Mark Corbin spake thusly:
> Add an upstream URL to the help text in Config.in. This
> addresses the 'Missing' URL status in the package stats
> web page output.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  package/tftpd/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/tftpd/Config.in b/package/tftpd/Config.in
> index ea5cb303f9..b9e1eff7a3 100644
> --- a/package/tftpd/Config.in
> +++ b/package/tftpd/Config.in
> @@ -6,3 +6,5 @@ config BR2_PACKAGE_TFTPD
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	help
>  	  HPA's Trivial File Transfer Protocol (tftp) server.
> +
> +	  http://freshmeat.sourceforge.net/projects/tftp-hpa

This page hasn't been updated for the past 8 years now.

Debian lists tftp-hpa's hopmepage to the git tree on kernel.org, so I've
done the same and applied to master. Thanks!

Regards,
Yann E. MORIN.

> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
