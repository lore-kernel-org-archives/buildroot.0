From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:17 +0200
Subject: [Buildroot] [PATCH 05/22] Rename Makefile.autotools.in to
	pkg-autotargets.mk
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ff135085fa831a97410105ebe844e953cab0b8e1.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in                                |    2 +-
 .../{Makefile.autotools.in => pkg-autotargets.mk}  |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/{Makefile.autotools.in => pkg-autotargets.mk} (100%)

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
-- 
1.7.4.1
