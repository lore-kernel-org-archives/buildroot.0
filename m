From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 May 2016 18:14:35 +0200
Subject: [Buildroot] [PATCH 10/13 v7] legal-info: explicitly state how
	patches are licensed
In-Reply-To: <cover.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <06715b41139076b878ea474bfad7afde1fe0bd83.1462637351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: slightly tweak after Arnout's review]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

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
2.7.4
