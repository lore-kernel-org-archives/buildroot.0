From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 23:07:27 +0200
Subject: [Buildroot] [git commit] docs/git.html: slightly reword for git
Message-ID: <20120425210805.2B34396BA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb19e8286115e33a2d2974d1fc55ad2eec4ae109
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of the wording didn't make much sense after we moved from svn to git.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/git.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/git.html b/docs/git.html
index bf894b9..0c99251 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -36,8 +36,8 @@ git pull
 </pre>
 
 Because you've only been granted anonymous access to the tree, you won't be
-able to commit any changes. Changes can be submitted for inclusion by posting
-them to the buildroot mailing list or to the <a
+able to push your changes to the repo. Changes can instead be submitted for
+inclusion by posting them to the buildroot mailing list or to the <a
 href="https://bugs.uclibc.org/">Bug and Patch Tracking System</a>.
 
 <!--#include file="footer.html" -->
