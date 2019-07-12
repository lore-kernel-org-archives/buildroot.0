From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 12 Jul 2019 11:06:41 +0200
Subject: [Buildroot] [PATCH] docs/manual: 'Fixes' tag needs a colon
Message-ID: <20190712090641.2471-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apparently, patchwork only recognizes the 'Fixes' tag if it is followed
by a colon. So make sure the manual documents it as such.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 docs/manual/contribute.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 868600d5d0..f339ca50b8 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -73,7 +73,7 @@ basically two things that can be done:
     In the commit message of a patch fixing an autobuild failure, add a
     reference to the build result directory, as follows:
 ---------------------
-Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
+Fixes: http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
 ---------------------
 
 === Reviewing and testing patches
-- 
2.21.0
