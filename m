From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 16:20:47 +0200
Subject: [Buildroot] [git commit] docs: update legal-notice.txt
Message-ID: <20160819142051.F18CD82199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=426389688d84b5e9c76548f71752d323226457e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 1273636fc686cd788b6de87be75dd0726cf8676c applied patches are also
saved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/legal-notice.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 0572dae..a4911f7 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -41,9 +41,9 @@ There you will find:
   +host-sources/+ subdirectories for target and host packages respectively.
   The source code for packages that set +<PKG>_REDISTRIBUTE = NO+ will not be
   saved.
-  Patches applied to some packages by Buildroot are distributed with the
-  Buildroot sources and are not duplicated in the +sources/+ and +host-sources/+
-  subdirectories.
+  Patches that were applied are also saved, along with a file named +series+
+  that lists the patches in the order they were applied. Patches are under the
+  same license as the files that they modify.
 * A manifest file (one for host and one for target packages) listing the
   configured packages, their version, license and related information.
   Some of this information might not be defined in Buildroot; such items are
