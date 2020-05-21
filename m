From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 May 2020 17:45:40 +0200
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove python-pycrypto
In-Reply-To: <20200521144340.74028-1-fontaine.fabrice@gmail.com>
References: <20200521144340.74028-1-fontaine.fabrice@gmail.com>
Message-ID: <20200521154540.GA2342@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-21 16:43 +0200, Fabrice Fontaine spake thusly:
> Commit 7ef76ed32fcd447391e26d33a555ff5dab6dc48e forgot to remove
> python-pycrypto entry from DEVELOPERS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b5c0590d25..41bcbea39b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2252,7 +2252,6 @@ F:	package/davfs2/
>  N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
>  F:	package/atftp/
>  F:	package/miraclecast/
> -F:	package/python-pycrypto/
>  F:	package/python-pysnmp/
>  F:	package/python-pysnmp-mibs/
>  F:	package/python-tornado/
> -- 
> 2.26.2
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
