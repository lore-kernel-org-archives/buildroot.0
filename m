From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 16:23:14 +0200
Subject: [Buildroot] [git commit] legal-info: explicitly state how patches
	are licensed
Message-ID: <20160624142506.D3B688219C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d271f89b0823987b3fa4db83166692da928c69f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: slightly tweak after Arnout's review]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
