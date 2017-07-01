From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Jul 2017 18:51:34 +0200
Subject: [Buildroot] [PATCH 3/3] scancpan: update old reference to
	support/scripts
In-Reply-To: <20170701164041.5515-3-arnout@mind.be>
References: <20170701164041.5515-1-arnout@mind.be>
 <20170701164041.5515-3-arnout@mind.be>
Message-ID: <20170701165134.GD3593@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-01 18:40 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> scancpan's help text refers to its location, so update it after the
> move to utils/.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for fixing my mess! :-)

Regards,
Yann E. MORIN.

> ---
>  utils/scancpan | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/scancpan b/utils/scancpan
> index 62df225361..9ccbac5a41 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -752,7 +752,7 @@ __END__
>  
>  =head1 NAME
>  
> -support/scripts/scancpan Try-Tiny Moo
> +utils/scancpan Try-Tiny Moo
>  
>  =head1 SYNOPSIS
>  
> -- 
> 2.13.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
