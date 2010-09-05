From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Tell git to ignore the Quilt
	internal directory in package/config
Message-ID: <20100905213834.800678A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=40177240fab04c710fd756a24816b451b37dc1b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/.gitignore |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/config/.gitignore b/package/config/.gitignore
index 624f650..106bc12 100644
--- a/package/config/.gitignore
+++ b/package/config/.gitignore
@@ -21,3 +21,8 @@ nconf
 qconf
 gconf
 kxgettext
+
+#
+# Quilt is being used to handle the patch series
+#
+.pc
-- 
1.7.1
