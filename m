From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  1 May 2018 22:09:48 +0200
Subject: [Buildroot] [PATCH 2/2] libcue: add upstream status to
 0001-libcue-is-only-implemented-in-C.patch
In-Reply-To: <20180501200948.13115-1-thomas.petazzoni@bootlin.com>
References: <20180501200948.13115-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180501200948.13115-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch 0001-libcue-is-only-implemented-in-C.patch has been
submitted upstream by Fabrice, let's put the link to the pull request
in the patch itself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcue/0001-libcue-is-only-implemented-in-C.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcue/0001-libcue-is-only-implemented-in-C.patch b/package/libcue/0001-libcue-is-only-implemented-in-C.patch
index bb36172ad1..70d38baa0c 100644
--- a/package/libcue/0001-libcue-is-only-implemented-in-C.patch
+++ b/package/libcue/0001-libcue-is-only-implemented-in-C.patch
@@ -12,6 +12,7 @@ Fixes:
  - http://autobuild.buildroot.net/results/a5344d18dbdc86705853fbf8a66d5304de07a9b2
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream-status: https://github.com/lipnitsk/libcue/pull/17
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.14.3
