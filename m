From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 08:06:27 +0100
Subject: [Buildroot] [PATCH 6/9] manual: minor fix in patch-policy.txt
In-Reply-To: <28331a810710249524be2ea3a286fff996ead804.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
 <28331a810710249524be2ea3a286fff996ead804.1360795941.git.s.martin49@gmail.com>
Message-ID: <511C8CF3.10608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 23:59, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>   docs/manual/patch-policy.txt | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index 78ac5b6..468a954 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -34,7 +34,7 @@ Most patches are provided within Buildroot, in the package
>   directory; these typically aim to fix cross-compilation, libc support,
>   or other such issues.
>
> -These patch files should be named +<packagename>-*.patch+.
> +These patch files should be named +<packagename>-<description>.patch+.
>
>   A +series+ file, as used by +quilt+, may also be added in the
>   package directory. In that case, the +series+ file defines the patch
> @@ -57,8 +57,8 @@ How patches are applied
>     applied according to the +series+ file;
>   +
>   * Otherwise, patch files matching `<packagename>-*.patch` or
> -  `<packagename>-*.patch.<arch>` (where +<arch>+ is the architecture
> -  name) are applied following the +ls+ command order.
> +  `<packagename>-<description>.patch.<arch>` (where +<arch>+ is the
> +  architecture name) are applied following the +ls+ command order.
>
>   . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
