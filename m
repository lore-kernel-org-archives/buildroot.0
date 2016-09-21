From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 14:34:07 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix packages having a subdirectory
Message-ID: <1474461247-18243-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efl and matchbox no longer have a subdirectory containing multiple
packages, so they are no longer good examples of that. Mention qt5 and
gstreamer instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index dc66f00..a74761c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -7,7 +7,7 @@ First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
 
 Some packages have been grouped by topic in a sub-directory:
-+x11r7+, +efl+ and +matchbox+. If your package fits in
++x11r7+, +qt5+ and +gstreamer+. If your package fits in
 one of these categories, then create your package directory in these.
 New subdirectories are discouraged, however.
 
-- 
2.7.4
