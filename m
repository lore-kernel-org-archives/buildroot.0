From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Sep 2013 09:00:15 +0200
Subject: [Buildroot] [git commit] docs/patch-policy.txt: fix missing word
Message-ID: <20130916134528.9170E9B7A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bfb52c1144a6d69a0a7c97281df28190c788f02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/patch-policy.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index d2250ad..c654d38 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -21,7 +21,7 @@ Providing patches
 Downloaded
 ^^^^^^^^^^
 
-If it is necessary to apply a patch that is available for download, then it
+If it is necessary to apply a patch that is available for download, then add it
 to the +<packagename>_PATCH+ variable. It is downloaded from the same site
 as the package itself. It can be a single patch, or a tarball containing a
 patch series.
