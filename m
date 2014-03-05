From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 18:17:30 +0100
Subject: [Buildroot] [PATCH 5 of 8] manual: contributing: add section on
 TODO list
In-Reply-To: <ecfdbbf9e5c5e4b35498.1394036671@argentina>
References: <patchbomb.1394036666@argentina>
 <ecfdbbf9e5c5e4b35498.1394036671@argentina>
Message-ID: <20140305171730.GD5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
> This patch adds a small section about working on items from the TODO list.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  docs/manual/contribute.txt |  8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -139,6 +139,14 @@ Buildroot's Patchwork website can be use
>  purposes. Please see xref:apply-patches-patchwork[] for more
>  information on using Buildroot's Patchwork website to apply patches.
>  
> +Work on items from the TODO list
> +--------------------------------
> +If you want to contribute to Buildroot but don't know where to start,

There should be an empty line below the '----' line. Even if asciidoc is
happy without one, it's not the way other chapters are written.

Regards,
Yann E. MORIN.

> +and you don't like any of the above topics, you can always work on items
> +from the http://elinux.org/Buildroot#Todo_list[Buildroot TODO list].
> +Don't hesitate to discuss an item first on the mailing list or on IRC.
> +Do edit the wiki to indicate when you start working on an item, so we
> +avoid duplicate efforts.
>  
>  [[submitting-patches]]
>  Submitting patches
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
