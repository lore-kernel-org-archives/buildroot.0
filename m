From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Oct 2017 22:25:43 +0200
Subject: [Buildroot] [PATCH v1] manual: clarify license file hash check
 during legal-info target
In-Reply-To: <20171017193015.18265-1-ps.report@gmx.net>
References: <20171017193015.18265-1-ps.report@gmx.net>
Message-ID: <20171017202543.GC3298@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-10-17 21:30 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-directory.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 809cc97389..c9857a80d3 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -482,7 +482,8 @@ this in a comment line above the hashes.
>  
>  .Note
>  The hashes for license files are used to detect a license change when a
> -package version is bumped. For a package with multiple versions (like Qt5),
> +package version is bumped. The hashes are checked during the make legal-info
> +target run. For a package with multiple versions (like Qt5),
>  create the hash file in a subdirectory +<packageversion>+ of that package
>  (see also xref:patch-apply-order[]).
>  
> -- 
> 2.14.2
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
