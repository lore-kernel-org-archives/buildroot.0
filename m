From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 18:22:33 +0100
Subject: [Buildroot] [PATCH 7 of 8] manual: contributing: don't
 recommend leaving out changelog from patches
In-Reply-To: <e95d3b84bcc4048fed60.1394036673@argentina>
References: <patchbomb.1394036666@argentina>
 <e95d3b84bcc4048fed60.1394036673@argentina>
Message-ID: <20140305172233.GE5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
> Currently, the manual states that if you send a series and include a
> changelog in the introduction mail (0 of x), it is not necessary to include
> a changelog on the individual patches.

> I don't like this: for large patch series it requires going back to the
> introduction mail when opening each patch, to understand what changed.
> This patch rewords the paragraph accordingly.

Maybe the "I don't like this" should not be part of the actual commit
log. The rest of the paragraph is OK, however.

Globally, I agree. I don't usually keep per-patch changelogs, but then I
can have a hard time writing the global changelog in the cover-letter.
Keeping a per-patch changelog (updated with each git commit --amend)
would greatly help write the global one.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  docs/manual/contribute.txt |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -220,8 +220,8 @@ Patch revision changelog
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

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
