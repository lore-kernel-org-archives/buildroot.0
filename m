From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2015 17:51:53 +0200
Subject: [Buildroot] [PATCH] system/skeleton: finalize removal of ftp
	user
In-Reply-To: <1445183127-493-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445183127-493-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151018155153.GD3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-18 17:45 +0200, Thomas Petazzoni spake thusly:
> In commit 3dde19e5f32c58ffbf7e190257b073e91e0a7e8d, the ftp user was
> removed from /etc/passwd, /etc/group and /home in the skeleton, but
> the corresponding entry was not removed from /etc/shadow. This commit
> fixes that.
> 
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/skeleton/etc/shadow | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
> index 972dd59..2ac2607 100644
> --- a/system/skeleton/etc/shadow
> +++ b/system/skeleton/etc/shadow
> @@ -5,5 +5,4 @@ sync:*:10933:0:99999:7:::
>  halt:*:10933:0:99999:7:::
>  uucp:*:10933:0:99999:7:::
>  operator:*:10933:0:99999:7:::
> -ftp:*:10933:0:99999:7:::
>  nobody:*:10933:0:99999:7:::
> -- 
> 2.6.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
