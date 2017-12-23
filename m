From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Dec 2017 23:30:48 +0100
Subject: [Buildroot] [PATCH 2/2] cryptsetup: add json-c dependency to
 host build
In-Reply-To: <385b491953e3abadd6dc39f1e869e12391aaac32.1514050983.git.baruch@tkos.co.il>
References: <874c469c732d0301687987f41dcbd7141f319b58.1514050983.git.baruch@tkos.co.il>
 <385b491953e3abadd6dc39f1e869e12391aaac32.1514050983.git.baruch@tkos.co.il>
Message-ID: <20171223223048.GB17887@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-12-23 19:43 +0200, Baruch Siach spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/ecf/ecf5d87791e0255c3fce117447105db88749f796/
> http://autobuild.buildroot.net/results/384/38462d222f2a893d44de894c30dc1e53d09c377d/
> http://autobuild.buildroot.net/results/c29/c2901415345d94ef2135e460f4c78c21ae7ad09a/
> ... and many more.
> 
> Cc: Martin Hicks <mort@bork.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/cryptsetup.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 1abee0bc2f9b..0d8480ba4886 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -33,6 +33,7 @@ HOST_CRYPTSETUP_DEPENDENCIES = \
>  	host-lvm2 \
>  	host-popt \
>  	host-util-linux \
> +	host-json-c \
>  	host-openssl
>  
>  HOST_CRYPTSETUP_CONF_OPTS = --with-crypto-backend=openssl
> -- 
> 2.15.1
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
