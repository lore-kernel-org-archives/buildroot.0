From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2020 18:46:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: add hash for license
 file
In-Reply-To: <20200421120738.3322692-1-fontaine.fabrice@gmail.com>
References: <20200421120738.3322692-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421164643.GT5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-21 14:07 +0200, Fabrice Fontaine spake thusly:
> Add hash for license file and update indentation (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This patch, and the thread patch, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbuffer/mbuffer.hash | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
> index 80b7b1f26c..105fe29fe7 100644
> --- a/package/mbuffer/mbuffer.hash
> +++ b/package/mbuffer/mbuffer.hash
> @@ -1,5 +1,8 @@
>  # From http://www.maier-komor.de/mbuffer.html
> -md5 e4acaa1e6a9a879e7394f04e02e1ae83  mbuffer-20191016.tgz
> +md5  e4acaa1e6a9a879e7394f04e02e1ae83  mbuffer-20191016.tgz
>  
>  # Locally computed after checking signature upstream
> -sha256 8dc210454765c18901074bc16e126c655135a486e73d69855caf74a157ddbe17  mbuffer-20191016.tgz
> +sha256  8dc210454765c18901074bc16e126c655135a486e73d69855caf74a157ddbe17  mbuffer-20191016.tgz
> +
> +# Hash for license file
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> -- 
> 2.25.1
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
