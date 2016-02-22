From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Feb 2016 15:23:15 +0100
Subject: [Buildroot] [PATCH 3/4] docs/manual/contribute.txt: add section
 for preparing patch series
In-Reply-To: <1454348717-4711-4-git-send-email-arnout@mind.be>
References: <1454348717-4711-1-git-send-email-arnout@mind.be>
 <1454348717-4711-4-git-send-email-arnout@mind.be>
Message-ID: <CAGm1_ksnWrHmd_Rm-xApYNvuLZG4sCTi1hMxsq9zqKUfsDp-6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 6:45 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> In subsequent patches, we will add more explanation about how to
> prepare patches, so it will be worthwhile to have a separate section
> for the series preparation.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> Note: for this patch, I started using
> http://dustycloud.org/blog/vcs-friendly-patchable-document-line-wrapping/
> If nobody opposes, I propose to require this formatting for the manual
> from now on. It will be weird for a while, but in the end I think it
> would be A Good Thing (TM). If that formatting had been followed, this
> patch, for example, would have a diffstat of +3 instead of the current
> +7-4.
> ---
>  docs/manual/contribute.txt | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index b74897d..e19ba15 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -182,10 +182,13 @@ _Please, do not attach patches to bugs, send them to the mailing list
>  instead_.
>
>  If you made some changes to Buildroot and you would like to contribute
> -them to the Buildroot project, proceed as follows. Starting from the
> -changes committed in your local git view, _rebase_ your development
> -branch on top of the upstream tree before generating a patch set. To do
> -so, run:
> +  them to the Buildroot project, proceed as follows.
> +
> +==== Preparing a patch series
> +
> +Starting from the changes committed in your local git view, _rebase_ your
> +  development branch on top of the upstream tree before generating a patch set.
> +To do so, run:
>
>  ---------------------
>  $ git fetch --all --tags
> --
> 2.7.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
