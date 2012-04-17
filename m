From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:18 +0200
Subject: [Buildroot] [PATCH 06/22] Rename Makefile.cmake.in to
	pkg-cmaketargets.mk
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9c83dfeb3c8b1fb3a2f5b32e0721939f89d90567.1334673910.git.thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
