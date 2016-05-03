From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 00:34:55 +0200
Subject: [Buildroot] [PATCH 13/13 v6] legal-info: explicitly state how
 patches are licensed
In-Reply-To: <d7b10938001e539340479d97a2b64f4ab49d3726.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
 <d7b10938001e539340479d97a2b64f4ab49d3726.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <20312e21-cb29-2e23-cab2-4e608acc37ab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/16 00:27, Yann E. MORIN wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr: slightyl tweak after Arnout's review]

  slightly :-)

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> ---
> Changes v5 -> v6:
>   - slightly tweak the phrasing  (Arnout)
> ---
>  support/legal-info/README.header | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 418de14..1f3524f 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -18,7 +18,8 @@ This material is composed of the following items.
>     sources/ subdirectory (except for the non-redistributable packages, which
>     have not been saved). Patches that were applied are also saved, along
>     with a file named 'series' that lists the patches in the order they were
> -   applied.
> +   applied. Patches are under the same license as the files that they modify
> +   in the original package.
>   * A manifest file listing the configured packages and related information.
>   * The license text of the packages; they have been saved in the licenses/
>     subdirectory.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
