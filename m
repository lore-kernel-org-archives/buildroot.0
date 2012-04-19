From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 16:06:38 +0200
Subject: [Buildroot] [git commit] Rename Makefile.cmake.in to
	pkg-cmaketargets.mk
Message-ID: <20120419194555.6D8AC96B1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e834da05b0deb0bbd6804afe2aa0ae28a136204f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                                |    2 +-
 package/{Makefile.cmake.in => pkg-cmaketargets.mk} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 20fac9a..ab5ea48 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -300,5 +300,5 @@ SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
 include package/pkg-autotargets.mk
-include package/Makefile.cmake.in
+include package/pkg-cmaketargets.mk
 include package/Makefile.package.in
diff --git a/package/Makefile.cmake.in b/package/pkg-cmaketargets.mk
similarity index 100%
rename from package/Makefile.cmake.in
rename to package/pkg-cmaketargets.mk
