From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 23:42:38 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] docs/manual: 'Fixes' tag
 needs a colon
Message-ID: <20190731213958.192E183A2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3055cb553f840e80bbe206c17b9aa7d9cb1ecd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Apparently, patchwork only recognizes the 'Fixes' tag if it is followed
by a colon. So make sure the manual documents it as such.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e875c2ffd2f23413e2c924a450c745aa7c785677)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
