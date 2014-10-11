From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Oct 2014 18:21:53 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20141011162152.GA4254@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-07-18 14:33 +0200, Johan Oudinet spake thusly:
> diff --git a/package/Config.in b/package/Config.in
> index 22ddea8..eb0aaaa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -943,6 +943,7 @@ endif
>  	source "package/dnsmasq/Config.in"
>  	source "package/dropbear/Config.in"
>  	source "package/ebtables/Config.in"
> +	source "package/ejabberd/Config.in"
>  	source "package/ethtool/Config.in"
>  	source "package/faifa/Config.in"
>  	source "package/fmc/Config.in"
[--SNIP--]

We've been discussing this ejabberd patch during the current Developpers
Day in D?sseldorf.

Given the current issues that ewre noticed with building ejabberd, we
decided to mark the patch as Rejected in patchwork.

This means that we rejected that very specific patch, *not* that we
decided not to have ejabberd. But before it gets included, all the
issues must be fixed first, especially the build-time downloading of
dependencies, as well as all the remarks that were made by Thomas and I.

Of course, we are happy to help solve them, if you need help/advice on
it.

Thank you for working on this!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
