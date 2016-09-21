From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 17:08:49 +0200
Subject: [Buildroot] [git commit] docs/manual: fix packages having a
	subdirectory
Message-ID: <20160921151053.7C198821D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=813016df77ba77dbdff5ab9c8244ed622cfa2fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

efl and matchbox no longer have a subdirectory containing multiple
packages, so they are no longer good examples of that. Mention qt5 and
gstreamer instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
