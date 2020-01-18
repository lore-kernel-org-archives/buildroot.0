From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 18:38:40 +0100
Subject: [Buildroot] [git commit] docs/manual/legal-notice.txt: update list
 of non-saved material
Message-ID: <20200118174537.844048282B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a74e57c932df5edd483ff43518fae4e931064d07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This list dates back to 2012. Since a long time now Buildroot saves the
patches applied as well as the actual source code for some external
toolchains. Update the manual accordingly.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/legal-notice.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 69753282ec..179aa6b179 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -67,9 +67,8 @@ for packages released under BSD-like licenses, that you are not required to
 redistribute in source form.
 
 Moreover, due to technical limitations, Buildroot does not produce some
-material that you will or may need, such as the toolchain source code and the
-Buildroot source code itself (including patches to packages for which source
-distribution is required).
+material that you will or may need, such as the toolchain source code for
+some of the external toolchains and the Buildroot source code itself.
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
