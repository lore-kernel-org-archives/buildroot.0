From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 18:37:45 +0100
Subject: [Buildroot] [PATCH 2 of 8] manual: contributing: add section on
 analyzing bug reports
In-Reply-To: <0cc2a6824f249999fa57.1394036668@argentina>
References: <patchbomb.1394036666@argentina>
 <0cc2a6824f249999fa57.1394036668@argentina>
Message-ID: <20140305173745.GH5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
> This patch adds a small section to the manual promoting the reproduction,
> analysis and fixing of bug reports.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/contribute.txt |  10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -23,6 +23,16 @@ source code tarball. Git is the easiest 
>  send your patches to the mailing list. Refer to xref:getting-buildroot[]
>  for more information on obtaining a Buildroot git tree.
>  
> +Reproducing, analyzing and fixing bugs
> +--------------------------------------
> +
> +A first way of contributing is to have a look at the open bug reports in
> +the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot bug
> +tracker]. As we strive to keep the bug count as small as possible, all
> +help in reproducing, analyzing and fixing reported bugs is more than
> +welcome. Don't hesitate to add a comment to bug reports reporting your
> +findings, even if you don't yet see the full picture.
> +
>  [[submitting-patches]]
>  Submitting patches
>  ------------------
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
