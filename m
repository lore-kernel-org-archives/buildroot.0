From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Dec 2015 23:20:27 +0100
Subject: [Buildroot] [PATCH 01/13 v2] core/legal-info: update the
 legal-info report header
In-Reply-To: <f0470f8dbed2b03668b7539bcf1cbbdbb99eeeea.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <f0470f8dbed2b03668b7539bcf1cbbdbb99eeeea.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <5671E3AB.9000800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-12-15 19:35, Yann E. MORIN wrote:
> In some cases, the toolchain sources are now recovered and available in
> the legal-info output. So, adapt the header to use conditional instead
> of an definitive negation.
> 
> Also update the part about saving the sources: it's not the license list
> that defines whether sources are installed, but rather whether the
> package is reditributable or not.

 redistributable

> 
> Update the header acoordingly.

 accordingly

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 This can go in regardless of the rest of the series.

 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - slight rephrasing  (Luca)
>   - move early in the series  (Luca)
> ---
>  support/legal-info/README.header | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 3321adb..d07c45d 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -12,12 +12,12 @@ This material is composed of the following items.
>   * The Buildroot configuration file; this has been saved in buildroot.config.
>   * The toolchain (cross-compiler and related tools) used to generate all the
>     compiled programs.
> -   Note: this has not been saved due to technical limitations, you must
> -   collect it manually.
> +   Note: this may have not been saved due to technical limitations, you may
> +   need to collect it manually.
>   * The source code for all packages; this has been saved in the sources/
> -   subdirectory (except for the proprietary packages, which have not been
> -   saved); patches applied to some packages by Buildroot are included in the
> -   Buildroot sources and were not duplicated in the sources/ subdirectory.
> +   subdirectory (except for the non-redistributable packages, which have not
> +   been saved); patches applied to some packages by Buildroot are included in
> +   the Buildroot sources and were not duplicated in the sources/ subdirectory.
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
