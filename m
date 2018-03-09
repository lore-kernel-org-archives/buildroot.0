From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:37:54 +0100
Subject: [Buildroot] [git commit] fbgrab: Fix some problems in the patch
 metadata
Message-ID: <20180309213813.B27EE82895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a0b4b2be2c76b836f4461fcf59f5e95dcd8549b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch description was missing Upstream-Status tag. It was given in the
commit which added this patch but not in the patch itself as should be.

Signed-off-by tag accidentally didn't follow the usual format.

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/0100-fix-pixfmt-report.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fbgrab/0100-fix-pixfmt-report.patch b/package/fbgrab/0100-fix-pixfmt-report.patch
index 18bcf96df2..8cff7ef8c3 100644
--- a/package/fbgrab/0100-fix-pixfmt-report.patch
+++ b/package/fbgrab/0100-fix-pixfmt-report.patch
@@ -4,7 +4,9 @@ When fbgrab tells about the framebuffer pixel format, blue and green
 are accidentally swapped in 'length' and 'msb_right' columns. Let's
 order everything as RGB.
 
-Signed-off-by timo.ketola at exertus.fi
+Upstream-Status: Submitted [Gunnar Monell <gmo@linux.nu>]
+
+Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
 
 diff -u a/fbgrab.c b/fbgrab.c
 --- a/fbgrab.c	2018-03-07 11:42:04.739250433 +0200
