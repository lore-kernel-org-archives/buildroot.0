From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jun 2016 21:50:26 +0200
Subject: [Buildroot] [PATCH 2/6] docs/manual: don't mention eglibc,
 mention musl
In-Reply-To: <1465422059-22254-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1b8c6606-ebaa-9d56-7b8e-d82e87c2ee27@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/06/2016 ? 23:40, Thomas Petazzoni a ?crit :
> Following the removal of eglibc, it no longer makes sense to talk about
> it in the Buildroot manual as one of the supported C libraries. However,
> it does make sense to indicate that we support musl.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  docs/manual/configure.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index 44f5d24..8491b17 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -83,7 +83,7 @@ applications and libraries for your target embedded system.
>  This backend supports several C libraries:
>  http://www.uclibc.org[uClibc], the
>  http://www.gnu.org/software/libc/libc.html[glibc] and
> -http://www.eglibc.org[eglibc].
> +http://www.musl-libc.org[musl].
>  
>  Once you have selected this backend, a number of options appear. The
>  most important ones allow to:
> 
