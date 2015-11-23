From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:52 +0100
Subject: [Buildroot] [PATCH 22/51] package/gcc: rename the common files
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <1873a3ed667d87a18d503545d54fb3da1af70b2d.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/{gcc.hash => gcc-common.hash} | 0
 package/gcc/{gcc.mk => gcc-common.mk}     | 0
 package/gcc/gcc-final/gcc-final.hash      | 2 +-
 package/gcc/gcc-initial/gcc-initial.hash  | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename package/gcc/{gcc.hash => gcc-common.hash} (100%)
 rename package/gcc/{gcc.mk => gcc-common.mk} (100%)

diff --git a/package/gcc/gcc.hash b/package/gcc/gcc-common.hash
similarity index 100%
rename from package/gcc/gcc.hash
rename to package/gcc/gcc-common.hash
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc-common.mk
similarity index 100%
rename from package/gcc/gcc.mk
rename to package/gcc/gcc-common.mk
diff --git a/package/gcc/gcc-final/gcc-final.hash b/package/gcc/gcc-final/gcc-final.hash
index 7ac9361..299f535 120000
--- a/package/gcc/gcc-final/gcc-final.hash
+++ b/package/gcc/gcc-final/gcc-final.hash
@@ -1 +1 @@
-../gcc.hash
\ No newline at end of file
+../gcc-common.hash
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/gcc-initial.hash b/package/gcc/gcc-initial/gcc-initial.hash
index 7ac9361..299f535 120000
--- a/package/gcc/gcc-initial/gcc-initial.hash
+++ b/package/gcc/gcc-initial/gcc-initial.hash
@@ -1 +1 @@
-../gcc.hash
\ No newline at end of file
+../gcc-common.hash
\ No newline at end of file
-- 
1.9.1
