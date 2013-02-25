From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Feb 2013 22:31:24 +0100
Subject: [Buildroot] [PATCH 04/11] working-with: board support
In-Reply-To: <cover.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
Message-ID: <bd4236ff40f9132d14f2f6610588847e92df93dc.1361827174.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v1:
* simplify cross-ref (Arnout)
---
 docs/manual/working-with.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index a57169c..4432b54 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -25,5 +25,5 @@ interested in hacking it to add:
 
 * new packages: refer to the xref:adding-packages[Developer guide]
 
-* new board support: refer to the xref:customize-store[], more specifically
-  xref:customize-store-board-support[].
+* new board support: refer to the
+  xref:customize-store-board-support[Developer guide].
-- 
1.8.1.4
