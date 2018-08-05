From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Aug 2018 13:48:05 +0200
Subject: [Buildroot] [PATCH] docs/manual: update host gcc minimum
 required version
In-Reply-To: <9d4d4477b77d5fea865f0b0e76982ac483665ac2.1533464011.git.baruch@tkos.co.il>
References: <9d4d4477b77d5fea865f0b0e76982ac483665ac2.1533464011.git.baruch@tkos.co.il>
Message-ID: <20180805114805.GB12445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-05 13:13 +0300, Baruch Siach spake thusly:
> The oldest gcc that is known to work with current Buildroot is that of
> RHEL 6, version 4.4.

I hadn't seen your patch before I sent mine, sorry.

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I've marked my patch as rejected, then (although I prefer my commit
message! ;-] ).

Regards,
Yann E. MORIN.

> ---
>  docs/manual/prerequisite.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index 110fab41fdae..66e1b88f1654 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -23,8 +23,8 @@ between distributions).
>  ** +make+ (version 3.81 or any later)
>  ** +binutils+
>  ** +build-essential+ (only for Debian based systems)
> -** +gcc+ (version 2.95 or any later)
> -** `g++` (version 2.95 or any later)
> +** +gcc+ (version 4.4 or any later)
> +** `g++` (version 4.4 or any later)
>  ** +bash+
>  ** +patch+
>  ** +gzip+
> -- 
> 2.18.0
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
