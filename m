From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:48:00 +0100
Subject: [Buildroot] [PATCH 09/13] docs/manual: mention that custom
 toolchains is also useful for BR toolchains
In-Reply-To: <1393167879-16637-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223154800.GJ3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/configure.txt | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index a6afafb..42d84fe 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -159,14 +159,14 @@ Then, you have three solutions to use an external toolchain:
>    toolchain.
>  
>  * Use a completely custom external toolchain. This is particularly
> -  useful for toolchains generated using crosstool-NG. To do this,
> -  select the +Custom toolchain+ solution in the +Toolchain+ list. You
> -  need to fill the +Toolchain path+, +Toolchain prefix+ and +External
> -  toolchain C library+ options. Then, you have to tell Buildroot what
> -  your external toolchain supports. If your external toolchain uses
> -  the 'glibc' library, you only have to tell whether your toolchain
> -  supports C\+\+ or not and whether it has built-in RPC support. If
> -  your external toolchain uses the 'uClibc'
> +  useful for toolchains generated using crosstool-NG or with Buildroot
> +  itself. To do this, select the +Custom toolchain+ solution in the
> +  +Toolchain+ list. You need to fill the +Toolchain path+, +Toolchain
> +  prefix+ and +External toolchain C library+ options. Then, you have
> +  to tell Buildroot what your external toolchain supports. If your
> +  external toolchain uses the 'glibc' library, you only have to tell
> +  whether your toolchain supports C\+\+ or not and whether it has
> +  built-in RPC support. If your external toolchain uses the 'uClibc'
>    library, then you have to tell Buildroot if it supports largefile,
>    IPv6, RPC, wide-char, locale, program invocation, threads and
>    C++. At the beginning of the execution, Buildroot will tell you if
> -- 
> 1.8.3.2
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
