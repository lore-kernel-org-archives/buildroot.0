From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Mar 2014 22:05:48 +0100
Subject: [Buildroot] [PATCH 8 of 8] manual: contributing: minor
 rewording of 'reporting bugs' section
In-Reply-To: <c79971c9c229295a42da.1394036674@argentina>
References: <patchbomb.1394036666@argentina>
 <c79971c9c229295a42da.1394036674@argentina>
Message-ID: <CAHXCMM+9ttSHtKpxbVrTau-3tgXSN-As64JYg_T4f7R4SSKP_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 5, 2014 at 5:24 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> This patch makes some minor fixes in the section about reporting bugs.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  docs/manual/contribute.txt |  15 ++++++++-------
>  1 files changed, 8 insertions(+), 7 deletions(-)
>
> Although I don't think this section belongs in the Contributing chapter,
> there currently isn't a better place. When I get to rethinking the manual
> structure, this can be changed.
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -266,16 +266,16 @@ This can be easily handled with +git for
>  ---------------------
>
>  [[reporting-bugs]]
> -Reporting issues/bugs, get help
> --------------------------------
> +Reporting issues/bugs or getting help
> +-------------------------------------
>
>  Before reporting any issue, please check
>  xref:mailing-list-subscribe[the mailing list archive] in case someone has

We could add a link to buildroot gmane. This iscertainly the easiest
way to search the ML archive.

>  already reported and fixed a similar problem.
>
> -However you choose to report bugs or get help,
> -xref:bugtracker[opening a bug] or
> -xref:mailing-list-subscribe[send a mail to the mailing list], there are
> +However you choose to report bugs or get help, either by
> +xref:bugtracker[opening a bug] or by
> +xref:mailing-list-subscribe[sending a mail to the mailing list], there are
>  a number of details to provide in order to help people reproduce and
>  find a solution to the issue.
>
> @@ -287,11 +287,12 @@ Here is a short list of details to provi
>  * host machine (OS/release)
>  * version of Buildroot
>  * target for which the build fails
> -* package(s) which the build fails
> +* package(s) for which the build fails
>  * the command that fails and its output
>  * any information you think that may be relevant
>
> -Additionnally, your can add the +.config+ file.
> +Additionally, you should add the +.config+ file (or if you know how, a
> ++defconfig+).
>
>  If some of these details are too large, do not hesitate to use a
>  pastebin service (see http://www.similarsitesearch.com/alternatives-to/pastebin.com[]).
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
