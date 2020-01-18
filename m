From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 18:38:42 +0100
Subject: [Buildroot] [git commit] core/legal-info: update list of saved
 material in README
Message-ID: <20200118174537.8C2A08282B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec7806897290cbcede9fe6bde22e083bc0557226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The README file saved by legal-info does not mention the host package
variant of the saved material. Add them.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/legal-info/README.header | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index d3bdf71bcf..55996b5303 100644
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
 
