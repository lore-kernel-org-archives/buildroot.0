From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:21:30 +0100
Subject: [Buildroot] [PATCH 14/51] core/legal-info: update the
 legal-info report header
In-Reply-To: <83f76ca51bb54091f3d490fbbcfdcbf7b0950e1a.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <83f76ca51bb54091f3d490fbbcfdcbf7b0950e1a.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <56607A1A.8070402@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

thanks for having updated this forgotten file! See my comments below.

Yann E. MORIN wrote:
> In some cases, the toolchain sources are now recovered and available in
> the legal-info output. So, adapt the header to use conditional instead
> of an definitive negation.
>
> Also update the part about saving the sources: it's not the license list
> that defines whether sources are installed, but rather whether the
> package is reditributable or not. Update the header acoordingly.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   support/legal-info/README.header | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 90fc445..08aa74d 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -12,11 +12,11 @@ This material is composed of the following items.
>    * The Buildroot configuration file; this has been saved in buildroot.config.
>    * The toolchain (cross-compiler and related tools) used to generate all the
>      compiled programs.
> -   Note: this has not been saved due to technical limitations, you must
> +   Note: this may not been saved due to technical limitations, you may need to

"may not been saved" -> "may have not been saved" I guess.

With that fixed:
  Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Since you're updating the README about features that are already in
master, this patch could be applied immediately. Except it probably
conflicts, so you might want to rework it and move it at the beginning
of your patchset (or submit independently) if you want it to be merged
more quickly.

-- 
Luca
