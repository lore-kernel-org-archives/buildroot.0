From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 14:15:58 +0200
Subject: [Buildroot] [PATCH] docs/manual: add the "mark as superseded"
	hint
In-Reply-To: <1441627745-1553-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441627745-1553-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55ED7FFE.9040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-15 14:09, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  docs/manual/contribute.txt |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 5f0762f..e24a0c5 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -298,6 +298,9 @@ $ git format-patch --subject-prefix "PATCH v4" \
>      -M -s -o outgoing origin/master
>  ---------------------
>  
> +When you provide a new version of a patch, please mark the old one as
> +superseded in http://patchwork.buildroot.org[patchwork].

 It may be useful to add that it's necessary to create an account to be able to
do that:

You need to create an account on patchwork to be able to modify the status of
your patches. Note that you can only change the status of patches you submitted
yourself.


 Regards,
 Arnout

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
