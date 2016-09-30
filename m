From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Sep 2016 23:30:10 +0200
Subject: [Buildroot] [PATCH] docs/manual: no warranty on output of
	legal-info
In-Reply-To: <1475270257-27153-1-git-send-email-yann.morin.1998@free.fr>
References: <1475270257-27153-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5e4138f3-7d0b-65b3-191f-5144edef8ddf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-09-16 23:17, Yann E. MORIN wrote:
> Explicitly state that there is no warranty about the accuracy of the
> content of the output of 'make legal-info'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/legal-notice.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 7c19bc3..ac291c8 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -73,6 +73,16 @@ distribution is required).
>  When you run +make legal-info+, Buildroot produces warnings in the +README+
>  file to inform you of relevant material that could not be saved.
>  
> +Finally, keep in mind that the output of +make legal-info+ is based on
> +declarative statements in each of the packages recipes. The Buildroot
> +developpers try to do their best at keeping those declarative statements
   developers                       to keep

With that:
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> +as accurate as possible, to the best of their knowledge. However, it is
> +very well possible that those declarative statements may not all be fully
> +accurate nor exhaustive. You (or your legal department) _have_ to check
> +the output of +make legal-info+ before using it as your own compliance
> +delivery. See the _NO WARRANTY_ clauses (clauses 11 and 12) in the
> ++COPYING+ file at the root of the Buildroot distribution.
> +
>  [[legal-info-list-licenses]]
>  === License abbreviations
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
