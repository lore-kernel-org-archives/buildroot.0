From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Jan 2016 18:50:53 +0100
Subject: [Buildroot] [PATCH 1/2] Update for 2015.11.1
In-Reply-To: <1453484674-8951-1-git-send-email-davepiq@yahoo.fr>
References: <1453484674-8951-1-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160122175053.GA3774@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2016-01-22 18:44 +0100, David Picard spake thusly:
> From: Peter Korsgaard <peter@korsgaard.com>
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: David Picard <davepiq@yahoo.fr>
> ---
>  CHANGES | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/CHANGES b/CHANGES
> index 336b195..7b7797c 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,13 @@
> +2015.11.1, Released December 5th, 2015
> +
> +	Fix for issue with the host package RPATH check when a custom host
> +	directory (BR2_HOST_DIR=/path/to/somewhere) is used.
> +
> +	Important (and/or security related) bugfixes for busybox,
> +	dropbear, libpng and openssl.
> +
> +	Updated/fixed packages: busybox, dropbear, gawk, libpng, openssl

I guess you did not really want to send that one, did you? ;-)

Regards,
Yann E. MORIN.

>  2015.11, Released November 30th, 2015
>  
>  	Minor fixes.
> -- 
> 1.9.1
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
