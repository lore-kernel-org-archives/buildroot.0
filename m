From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:46:06 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/libglib2: correct
 upstream status for patch 0001
Message-ID: <20201221134035.7CFFE83E46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b53e87054830bcddda64c11299b3f48ba3da5589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Patch '0001-fix-compile-time-atomic-detection.patch' claims to be Merged but
this is not true. The linked issue is closed with 'Needs information', and
the code itself is effectively not merged.

Clarify the 'Upstream-status' line to make this more clear.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 43021dfb77b1a841305f625d923688316dc53d4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/0001-fix-compile-time-atomic-detection.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
