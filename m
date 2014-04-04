From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 07:59:05 +0200
Subject: [Buildroot] [PATCH v3 1/1] manual/configure.txt: fix typo
In-Reply-To: <1396560067-14091-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396560067-14091-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <533E4A29.2070009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/14 23:21, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

 Could you add to the commit log _why_ this is a typo? You're removing a
backslash in one place and adding it in another place, so it is not at
all obvious why this is the correct thing to do. In fact, it's not a
typo, it's a formatting error.

 Regards,
 Arnout

> ---
> v3:
>  - rebase on top of the master
> v2:
>  - remove only one backslash
> 
>  docs/manual/configure.txt |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index c1c9477..ee5e65e 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -100,7 +100,7 @@ most important ones allow to:
>     toolchain should have largefile support (i.e. support for files
>     larger than 2 GB on 32 bits systems), IPv6 support, RPC support
>     (used mainly for NFS), wide-char support, locale support (for
> -   internationalization), C\++ support or thread support. Depending on
> +   internationalization), C++ support or thread support. Depending on
>     which options you choose, the number of userspace applications and
>     libraries visible in Buildroot menus will change: many applications
>     and libraries require certain toolchain options to be enabled. Most
> @@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
>    prefix+ and +External toolchain C library+ options. Then, you have
>    to tell Buildroot what your external toolchain supports. If your
>    external toolchain uses the 'glibc' library, you only have to tell
> -  whether your toolchain supports C++ or not and whether it has
> +  whether your toolchain supports C\++ or not and whether it has
>    built-in RPC support. If your external toolchain uses the 'uClibc'
>    library, then you have to tell Buildroot if it supports largefile,
>    IPv6, RPC, wide-char, locale, program invocation, threads and
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
