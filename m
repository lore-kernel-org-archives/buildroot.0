From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Apr 2014 00:05:57 +0200
Subject: [Buildroot] [PATCH] give a hint about git rebase
In-Reply-To: <1398799827-13701-1-git-send-email-wbx@openadk.org>
References: <1398799827-13701-1-git-send-email-wbx@openadk.org>
Message-ID: <53602245.4050008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/14 21:30, Waldemar Brodkorb wrote:
> It seems common knowledge to use git rebase in interactive mode
> to fixup issues while respinning patch series, but I found it hard
> to find any hint about it. Add a note for git beginners like me.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  docs/manual/contribute.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 47494cb..7795e71 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -230,6 +230,8 @@ should include a changelog of the modifications between each
>  submission. Note that when your patch series is introduced by a cover
>  letter, an overall changelog may be added to the cover letter in
>  addition to the changelog in the individual commits.
> +The best thing to rework a patch series is by using +git rebase+
> +in interactive mode.

 If you're making such a suggestion, it's good to provide just a little
bit more information:

The best thing to rework a patch series is by interactive rebasing: +git
rebase -i origin/master+. Consult the git manual for more information.


 Regards,
 Arnout

>  
>  When added to the individual commits, this changelog is added when
>  editing the commit message.  Below the +Signed-off-by+ section, add
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
