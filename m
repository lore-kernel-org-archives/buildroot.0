From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 18 Jan 2020 17:18:19 +0100
Subject: [Buildroot] [PATCH 1/2] docs/manual/legal-notice.txt: update list
 of non-saved material
Message-ID: <20200118161820.12412-1-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This list dates back to 2012. Since a long time now Buildroot saves the
patches applied as well as the actual source code for some external
toolchains. Update the manual accordingly.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/legal-notice.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 69753282ec30..179aa6b1798e 100644
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
 
-- 
2.25.0
