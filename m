From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 16:12:24 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: add the "mark as superseded"
	hint
In-Reply-To: <1441628850-2737-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441628850-2737-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55ED9B48.9030207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-15 14:27, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Well, since you changed the original patch quite heavily, my acked doesn't hold
anymore... But of course, this one looks good as well so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> Changes v1 -> v2:
>   - Specify that an account in patchwork is needed (Suggested by Arnout)
> 
>  docs/manual/contribute.txt |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 5f0762f..40579f9 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -298,6 +298,14 @@ $ git format-patch --subject-prefix "PATCH v4" \
>      -M -s -o outgoing origin/master
>  ---------------------
>  
> +When you provide a new version of a patch, please mark the old one as
> +superseded in http://patchwork.buildroot.org[patchwork]. You need to
> +create an account on http://patchwork.buildroot.org[patchwork] to be
> +able to modify the status of your patches. Note that you can only change
> +the status of patches you submitted yourself, which means the email
> +address you register in http://patchwork.buildroot.org[patchwork] should
> +match the one you use for sending patches to the mailing list.
> +
>  [[reporting-bugs]]
>  === Reporting issues/bugs or getting help
>  
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
