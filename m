From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 18:45:28 +0100
Subject: [Buildroot] [PATCH 8 of 8] manual: contributing: minor
 rewording of 'reporting bugs' section
In-Reply-To: <c79971c9c229295a42da.1394036674@argentina>
References: <patchbomb.1394036666@argentina>
 <c79971c9c229295a42da.1394036674@argentina>
Message-ID: <20140305174528.GJ5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
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

... the +.config+ file (or better yet, a +defconfig+)

>  If some of these details are too large, do not hesitate to use a
>  pastebin service (see http://www.similarsitesearch.com/alternatives-to/pastebin.com[]).

There are some pastebin sites which, when you download the 'raw' paste,
will send you a CRLF file. This is inconvenient, since the files have to
be converted first. Maybe we could list a pastebins that don;t do that,
and list them prominently?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
