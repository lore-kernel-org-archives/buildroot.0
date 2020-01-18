From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 18 Jan 2020 17:18:20 +0100
Subject: [Buildroot] [PATCH 2/2] core/legal-info: update list of saved
 material in README
In-Reply-To: <20200118161820.12412-1-luca@lucaceresoli.net>
References: <20200118161820.12412-1-luca@lucaceresoli.net>
Message-ID: <20200118161820.12412-2-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The README file saved by legal-info does not mention the host package
variant of the saved material. Add them.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/legal-info/README.header | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index d3bdf71bcffe..55996b53036c 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -14,18 +14,22 @@ This material is composed of the following items.
    compiled programs.
    Note: this may have not been saved due to technical limitations, you may
    need to collect it manually.
- * The original source code for all packages; this has been saved in the
-   sources/ subdirectory (except for the non-redistributable packages, which
-   have not been saved). Patches that were applied are also saved, along
-   with a file named 'series' that lists the patches in the order they were
-   applied. Patches are under the same license as the files that they modify
-   in the original package.
+ * The original source code for target packages in the 'sources/'
+   subdirectory and for host packages in the 'host-sources/' subdirectory
+   (except for the non-redistributable packages, which have not been
+   saved). Patches that were applied are also saved, along with a file
+   named 'series' that lists the patches in the order they were
+   applied. Patches are under the same license as the files that they
+   modify in the original package.
    Note: Buildroot applies additional patches to Libtool scripts of
    autotools-based packages. These patches can be found under
    support/libtool in the Buildroot source and, due to technical
    limitations, are not saved with the package sources. You may need
    to collect them manually.
- * A manifest file listing the configured packages and related information.
- * The license text of the packages; they have been saved in the licenses/
-   subdirectory.
+ * Two manifest files listing the configured packages and related
+   information: 'manifest.csv' for target packages and 'host-manifest.csv'
+   for host packages.
+ * The license text of the packages, in the 'licenses/' and
+   'host-licenses/' subdirectories for target and host packages
+   respectively.
 
-- 
2.25.0
