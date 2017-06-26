From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:43:37 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] expat: fix patch that
	doesn't apply properly
Message-ID: <20170626081042.6E41481945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2a355e8bebecd8240fcc764c2fc7347ad48f2f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:

  http://autobuild.buildroot.net/results/23f799009ae10c5de2b06a7747a28804818204c2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 1940a66114bb6962dfdcee928e5c5fa5f29c0be7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch b/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
index a302553..44f43e1 100644
--- a/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
+++ b/package/expat/0001-configure.ac-Fix-mis-detection-of-getrandom-on-Debia.patch
@@ -11,10 +11,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  expat/configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/expat/configure.ac b/expat/configure.ac
+diff --git a/configure.ac b/configure.ac
 index 1357c9a..444c002 100644
---- a/expat/configure.ac
-+++ b/expat/configure.ac
+--- a/configure.ac
++++ b/configure.ac
 @@ -130,7 +130,7 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([
  
  
