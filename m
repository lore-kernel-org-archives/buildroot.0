From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 22:04:39 +0100
Subject: [Buildroot] [git commit] core/legal-info: update the legal-info
	report header
Message-ID: <20160201224705.00C897F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a8baa17a86533fd6becb01ea38b2de107050872
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases, the toolchain sources are now recovered and available in
the legal-info output. So, adapt the header to use conditional instead
of an definitive negation.

Also update the part about saving the sources: it's not the license list
that defines whether sources are installed, but rather whether the
package is redistributable or not.

Update the header accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/legal-info/README.header | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/legal-info/README.header b/support/legal-info/README.header
index 3321adb..d07c45d 100644
--- a/support/legal-info/README.header
+++ b/support/legal-info/README.header
@@ -12,12 +12,12 @@ This material is composed of the following items.
  * The Buildroot configuration file; this has been saved in buildroot.config.
  * The toolchain (cross-compiler and related tools) used to generate all the
    compiled programs.
-   Note: this has not been saved due to technical limitations, you must
-   collect it manually.
+   Note: this may have not been saved due to technical limitations, you may
+   need to collect it manually.
  * The source code for all packages; this has been saved in the sources/
-   subdirectory (except for the proprietary packages, which have not been
-   saved); patches applied to some packages by Buildroot are included in the
-   Buildroot sources and were not duplicated in the sources/ subdirectory.
+   subdirectory (except for the non-redistributable packages, which have not
+   been saved); patches applied to some packages by Buildroot are included in
+   the Buildroot sources and were not duplicated in the sources/ subdirectory.
  * A manifest file listing the configured packages and related information.
  * The license text of the packages; they have been saved in the licenses/
    subdirectory.
