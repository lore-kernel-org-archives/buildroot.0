From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 6 Mar 2014 13:02:03 +0100
Subject: [Buildroot] [PATCH 6 of 7] manual: contributing: minor
 rewording of 'reporting bugs' section
In-Reply-To: <979bfcee73f165aa7129.1394100454@argentina>
References: <patchbomb.1394100448@argentina>
 <979bfcee73f165aa7129.1394100454@argentina>
Message-ID: <CAHXCMMLnpxCyndzb8NJr=1GOP6r7XWzgvAynWpZkNDLXNj3r2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 6, 2014 at 11:07 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> This patch makes some minor fixes in the section about reporting bugs.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

>
> ---
> v2: provide an explicit list of 'good' pastebins (Yann)
>
>  docs/manual/contribute.txt |  21 +++++++++++++--------
>  1 files changed, 13 insertions(+), 8 deletions(-)
>
> Although I don't think this section belongs in the Contributing chapter,
> there currently isn't a better place. When I get to rethinking the manual
> structure, this can be changed.
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -274,16 +274,16 @@ This can be easily handled with +git for
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
> @@ -295,11 +295,16 @@ Here is a short list of details to provi
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
> -pastebin service (see http://www.similarsitesearch.com/alternatives-to/pastebin.com[]).
> +pastebin service. Note that not all available pastebin services will
> +preserve Unix-style line terminators when downloading raw pastes.
> +Following pastebin services are known to work correctly:
> +- https://gist.github.com/
> +- http://code.bulix.org/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regads,

-- 
Samuel
