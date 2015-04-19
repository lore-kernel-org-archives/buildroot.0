From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Apr 2015 18:47:20 +0200
Subject: [Buildroot] [PATCH 3/7 v5] package/uclibc: add missing hash for
	eXtensa
In-Reply-To: <5ebea83fd4fa6be72e9176af095aa19a4e8b8e06.1429447148.git.yann.morin.1998@free.fr>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <5ebea83fd4fa6be72e9176af095aa19a4e8b8e06.1429447148.git.yann.morin.1998@free.fr>
Message-ID: <5533DC18.7030907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 14:44, Yann E. MORIN wrote:
> This is a git snapshot, we can't have a hash for it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 My reviewed-by still stands, but you should probably also fix the hash for arc,
which currently still points at 2014.08 while we use 2014.12 and it's from github

none xxx uClibc-arc-2014.12.tar.gz


 Regards,
 Arnout

> ---
>  package/uclibc/uclibc.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 69cc103..971ab26 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -6,3 +6,6 @@ sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-a
>  
>  # From http://www.uclibc-ng.org/trac/
>  sha256  e561040293ba4f21dcf3285ca1f683b5a8493eb0ffd3b3e495122cfde5a64a0e        uClibc-ng-1.0.1.tar.xz
> +
> +# No hash for this git snapshot
> +none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
