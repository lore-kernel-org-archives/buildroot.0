From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:48:41 +0100
Subject: [Buildroot] [git commit] package/libglib2: correct upstream status
 for patch 0001
Message-ID: <20201214143257.0FC7E86E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43021dfb77b1a841305f625d923688316dc53d4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch '0001-fix-compile-time-atomic-detection.patch' claims to be Merged but
this is not true. The linked issue is closed with 'Needs information', and
the code itself is effectively not merged.

Clarify the 'Upstream-status' line to make this more clear.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
