From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 22:42:40 +0200
Subject: [Buildroot] [PATCH 4/6] manual: document BR2_GRAPH_DEPTH
In-Reply-To: <cover.1397421554.git.yann.morin.1998@free.fr>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
Message-ID: <53842f4d578cc6d1ab9ca744a954800e95a11316.1397421554.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index d9de598..c9d5eb9 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -96,6 +96,8 @@ to +make+ or set in the environment:
   build-time graphs
 * +BR2_GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
   default), or +png+.
+* +BR2_GRAPH_DEPTH+ (an integer) to limit the depth of the dependency graph.
+  The default, +0+, is to not limit the depth.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
-- 
1.8.3.2
