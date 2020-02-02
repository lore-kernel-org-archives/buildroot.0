From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 14:59:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: remove trailing whitespace
 in php.hash
In-Reply-To: <20200202135245.3841342-1-fontaine.fabrice@gmail.com>
References: <20200202135245.3841342-1-fontaine.fabrice@gmail.com>
Message-ID: <20200202135948.GA25002@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-02 14:52 +0100, Fabrice Fontaine spake thusly:
> A trailing whitespace was added by commit
> 26c16e9d5b2305e6da99762a254621fe257216be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php/php.hash | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index f4142cec80..69bc1cb6a5 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -3,4 +3,3 @@ sha256 98284deac017da0d426117ecae7599a1f1bf62ae3911e8bc16c4403a8f4bdf13  php-7.4
>  
>  # License file
>  sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
> -
> -- 
> 2.24.1
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
