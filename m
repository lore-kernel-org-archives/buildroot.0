From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  9 Dec 2020 12:26:32 +0100
Subject: [Buildroot] [PATCH] package/libglib2: correct upstream status for
 patch 0001
Message-ID: <20201209112634.18600-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Patch '0001-fix-compile-time-atomic-detection.patch' claims to be Merged but
this is not true. The linked issue is closed with 'Needs information', and
the code itself is effectively not merged.

Clarify the 'Upstream-status' line to make this more clear.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/libglib2/0001-fix-compile-time-atomic-detection.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Note: I leave the actual discussion with upstream to Adam, as he was involved in
the issue before.



diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
index 9d2381bb35..d84a1ab460 100644
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Fix compile time atomic detection
 
 Improved compile-time detection of atomic support in the compiler.
 
-Upstream-Status: Merged
+Upstream-Status: 'Needs information'
 See : https://gitlab.gnome.org/GNOME/glib/issues/1063
 
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-- 
2.26.2
