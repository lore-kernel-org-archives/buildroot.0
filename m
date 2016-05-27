From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 19:49:32 +0200
Subject: [Buildroot] [PATCH next 4/4] docs: add documentation for
 BR2_TOOLCHAIN_BINUTILS_AT_LEAST
In-Reply-To: <1464351957-50031-4-git-send-email-Vincent.Riera@imgtec.com>
References: <1464351957-50031-1-git-send-email-Vincent.Riera@imgtec.com>
 <1464351957-50031-4-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160527174932.GD3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-05-27 13:25 +0100, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-directory.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 5537032..f3baa9b 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -294,6 +294,12 @@ use in the comment.
>  ** Comment string: +headers >= X.Y+ and/or `headers <= X.Y` (replace
>     +X.Y+ with the proper version)
>  
> +* Binutils version
> +** Dependency symbol: +BR2_TOOLCHAIN_BINUTILS_AT_LEAST_X_Y+, (replace
> +   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> +** Comment string: +binutils >= X.Y+ and/or `binutils <= X.Y` (replace
> +   +X.Y+ with the proper version)
> +
>  * GCC version
>  ** Dependency symbol: +BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y+, (replace
>     +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> -- 
> 2.7.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
