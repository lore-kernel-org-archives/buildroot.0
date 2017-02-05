From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 22:47:01 +0100
Subject: [Buildroot] [git commit] docs/website: bump jquery and bootstrap
Message-ID: <20170205214745.53DF2820F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad2f351a1d981978df74823ebb78cc6a3323f2fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps jquery and bootstrap to the latest versions.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/footer.html | 4 ++--
 docs/website/header.html | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 16fab36..1fcfd70 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,5 +1,5 @@
-	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
-	<script src="https://oss.maxcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
+	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
+	<script src="https://oss.maxcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
 	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
diff --git a/docs/website/header.html b/docs/website/header.html
index 3842f32..ef6724f 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -10,7 +10,7 @@
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-	<link href="https://oss.maxcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet">
+	<link href="https://oss.maxcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet">
 	<link href="css/main.css" rel="stylesheet">
 
 	<!--[if lt IE 9]>
