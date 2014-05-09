From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 09 May 2014 22:20:35 +0200
Subject: [Buildroot] [PATCH 7/7] manual: document the new
	graph-depends	options
In-Reply-To: <ccbf2dd69529d62cc925cc891016988e2cb59bbb.1399647182.git.yann.morin.1998@free.fr>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
 <ccbf2dd69529d62cc925cc891016988e2cb59bbb.1399647182.git.yann.morin.1998@free.fr>
Message-ID: <bd3ce16a-2b38-409e-94a8-a66fb356bfb6@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>---
> docs/manual/common-usage.txt | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
>index 3d5842d..33e0462 100644
>--- a/docs/manual/common-usage.txt
>+++ b/docs/manual/common-usage.txt
>@@ -94,6 +94,10 @@ to +make+ or set in the environment:
>   default), or +png+.
> * +BR2_GRAPH_DEPTH+ (an integer) to limit the depth of the dependency graph.
>   The default, +0+, is to not limit the depth.
>+* +BR2_GRAPH_NO_TRANSITIVE+, if set and non-empty, to not draw the transitive
>+  dependencies. The default is to draw transitive dependencies.
>+* +BR2_GRAPH_DOT_OPTS+ is passed verbatim as options to the +dot+ utility to
>+  draw the dependency graph.
> 
> An example that uses config files located in the toplevel directory and
> in your $HOME:
>@@ -198,6 +202,8 @@ supported.
> BR2_GRAPH_OUT=svg make graph-depends
> --------------------------------
> 
>+See xref:env-vars[] for other ways to customize the dependency graph.
>+
> === Graphing the build duration
> 
> [[graph-duration]]

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(Checked for spelling only)
