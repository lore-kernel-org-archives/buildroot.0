From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 23:15:14 +0100
Subject: [Buildroot] [PATCH v2 2/5] docs/manual: slightly clarify patch
	licensing
In-Reply-To: <1454365196-26319-3-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <56BBB672.2050700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 23:19, Luca Ceresoli wrote:
> Adding a patch is a modification to Buildroot. Thus this sentence might be
> interpreted as "Patches are released under the Buildroot license".
> 
> Being a legal matter, the last thing we want is to be
> ambiguous. Reword the sentence to avoid any misunderstandings.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Please still add this in 2016.02.


 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
> - "they modify" -> "they apply to" (Thomas).
> ---
>  docs/manual/patch-policy.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index 0b4604e..d50c971 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -90,8 +90,8 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
>  
>  === Format and licensing of the package patches
>  
> -Patches are released under the same license as the software that is
> -modified.
> +Patches are released under the same license as the software they apply
> +to.
>  
>  A message explaining what the patch does, and why it is needed, should
>  be added in the header commentary of the patch.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
