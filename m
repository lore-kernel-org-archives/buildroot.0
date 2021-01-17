From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:13:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: depend on python3
In-Reply-To: <20210116082508.239321-1-asafka7@gmail.com>
References: <20210116082508.239321-1-asafka7@gmail.com>
Message-ID: <20210117091320.GZ2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2021-01-16 10:25 +0200, Asaf Kahlon spake thusly:
> python-bleak doesn't support python2.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/22e6139a221e64ce96e23d68a58b60074fc95473/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-bleak/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
> index 3266932883..6015361899 100644
> --- a/package/python-bleak/Config.in
> +++ b/package/python-bleak/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_BLEAK
>  	bool "python-bleak"
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_TXDBUS # runtime
>  	help
>  	  Bluetooth Low Energy platform Agnostic Klient.
> -- 
> 2.27.0
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
