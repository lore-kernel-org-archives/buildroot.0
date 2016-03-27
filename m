From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Mar 2016 22:49:24 +0200
Subject: [Buildroot] [PATCH 16/16 v5] legal-info: explicitly state how
 patches are licensed
In-Reply-To: <d6c5a79915775eaa9d1a6d1711a4955cafe221cd.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <d6c5a79915775eaa9d1a6d1711a4955cafe221cd.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <56F84754.5060500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/16 18:49, Yann E. MORIN wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   support/legal-info/README.header | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 418de14..feee104 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -18,7 +18,7 @@ This material is composed of the following items.
>      sources/ subdirectory (except for the non-redistributable packages, which
>      have not been saved). Patches that were applied are also saved, along
>      with a file named 'series' that lists the patches in the order they were
> -   applied.
> +   applied. Patches are under the same license as the original package.

  When a package has several licenses for several of its components, the patches 
are actually under the license of the components they touch. So I would 
summarize this as:

  Patches are under the same license of the files that they modify in the 
original package.

  Regards,
  Arnout

>    * A manifest file listing the configured packages and related information.
>    * The license text of the packages; they have been saved in the licenses/
>      subdirectory.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
