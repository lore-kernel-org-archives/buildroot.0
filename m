From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 16:05:53 +0200
Subject: [Buildroot] [git commit] Rename Makefile.autotools.in to
	pkg-autotargets.mk
Message-ID: <20120419194555.5E02496B1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ff4c584c80b0fe3d7ebb866e388b53859fb2c4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                                |    2 +-
 .../{Makefile.autotools.in => pkg-autotargets.mk}  |    0
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c344c6b..20fac9a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -299,6 +299,6 @@ else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
-include package/Makefile.autotools.in
+include package/pkg-autotargets.mk
 include package/Makefile.cmake.in
 include package/Makefile.package.in
diff --git a/package/Makefile.autotools.in b/package/pkg-autotargets.mk
similarity index 100%
rename from package/Makefile.autotools.in
rename to package/pkg-autotargets.mk
