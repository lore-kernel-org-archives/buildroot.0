From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:34:19 +0100
Subject: [Buildroot] [PATCH 06/13] Rename Makefile.cmake.in to
	pkg-cmaketargets.mk
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ef899409e3e1ebdb45553340fcbf3fe94354003a.1331148806.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                                |    2 +-
 package/{Makefile.cmake.in => pkg-cmaketargets.mk} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/{Makefile.cmake.in => pkg-cmaketargets.mk} (100%)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0a0f94d..5f0d00a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -299,5 +299,5 @@ SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
 include package/pkg-autotargets.mk
-include package/Makefile.cmake.in
+include package/pkg-cmaketargets.mk
 include package/Makefile.package.in
diff --git a/package/Makefile.cmake.in b/package/pkg-cmaketargets.mk
similarity index 100%
rename from package/Makefile.cmake.in
rename to package/pkg-cmaketargets.mk
-- 
1.7.4.1
