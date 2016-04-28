From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:31 +0200
Subject: [Buildroot] [PATCH 13/13 v6] legal-info: explicitly state how
	patches are licensed
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <d7b10938001e539340479d97a2b64f4ab49d3726.1461881416.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: slightyl tweak after Arnout's review]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v5 -> v6:
  - slightly tweak the phrasing  (Arnout)
---
 support/legal-info/README.header | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 418de14..1f3524f 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -18,7 +18,8 @@ This material is composed of the following items.
    sources/ subdirectory (except for the non-redistributable packages, which
    have not been saved). Patches that were applied are also saved, along
    with a file named 'series' that lists the patches in the order they were
-   applied.
+   applied. Patches are under the same license as the files that they modify
+   in the original package.
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
-- 
1.9.1
