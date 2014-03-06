From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Mar 2014 12:59:48 +0100
Subject: [Buildroot] [PATCH 5 of 7] manual: contributing: don't
 recommend leaving out changelog from patches
In-Reply-To: <c20a18296e25b5f758c2.1394100453@argentina>
References: <patchbomb.1394100448@argentina>
 <c20a18296e25b5f758c2.1394100453@argentina>
Message-ID: <CAHXCMM+=6op3NmYU5YkB9h7bwk6gyAA8v02xweTMbipm+yyNrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 6, 2014 at 11:07 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Currently, the manual states that if you send a series and include a
> changelog in the introduction mail (0 of x), it is not necessary to include
> a changelog on the individual patches.
> This is not always convenient: for large patch series it requires going back
> to the introduction mail when opening each patch, to understand what
> changed.
> This patch rewords the paragraph accordingly.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

>
> ---
> v2: remove personal statements from commit message (Yann)
>
>  docs/manual/contribute.txt |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -228,8 +228,8 @@ Patch revision changelog
>  When improvements are requested, the new revision of each commit
>  should include a changelog of the modifications between each
>  submission. Note that when your patch series is introduced by a cover
> -letter, the changelog may be added in the cover letter rather than in
> -the individual commits.
> +letter, an overall changelog may be added to the cover letter in
> +addition to the changelog in the individual commits.
>
>  When added to the individual commits, this changelog is added when
>  editing the commit message.  Below the +Signed-off-by+ section, add
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

,Regards

-- 
Samuel
