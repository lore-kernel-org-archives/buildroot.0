From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Apr 2015 14:13:07 +0200
Subject: [Buildroot] [PATCH 2/6 v3] package/gcc: add hashes
In-Reply-To: <cover.1428322317.git.yann.morin.1998@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
Message-ID: <c37aadb0ebb3d9331f0cfb1833ea3893c74aba20.1428322317.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc-final/gcc-final.hash     | 1 +
 package/gcc/gcc-initial/gcc-initial.hash | 1 +
 package/gcc/gcc.hash                     | 7 +++++++
 3 files changed, 9 insertions(+)
 create mode 120000 package/gcc/gcc-final/gcc-final.hash
 create mode 120000 package/gcc/gcc-initial/gcc-initial.hash
 create mode 100644 package/gcc/gcc.hash

diff --git a/package/gcc/gcc-final/gcc-final.hash b/package/gcc/gcc-final/gcc-final.hash
new file mode 120000
index 0000000..7ac9361
--- /dev/null
+++ b/package/gcc/gcc-final/gcc-final.hash
@@ -0,0 +1 @@
+../gcc.hash
\ No newline at end of file
diff --git a/package/gcc/gcc-initial/gcc-initial.hash b/package/gcc/gcc-initial/gcc-initial.hash
new file mode 120000
index 0000000..7ac9361
--- /dev/null
+++ b/package/gcc/gcc-initial/gcc-initial.hash
@@ -0,0 +1 @@
+../gcc.hash
\ No newline at end of file
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
new file mode 100644
index 0000000..d9a04fc
--- /dev/null
+++ b/package/gcc/gcc.hash
@@ -0,0 +1,7 @@
+# Locally computed (upstream only has sigs):
+sha256  eef3f0456db8c3d992cbb51d5d32558190bc14f3bc19383dd93acc27acc6befc  gcc-4.5.4.tar.bz2
+sha256  92e61c6dc3a0a449e62d72a38185fda550168a86702dea07125ebd3ec3996282  gcc-4.7.4.tar.bz2
+sha256  4a80aa23798b8e9b5793494b8c976b39b8d9aa2e53cd5ed5534aff662a7f8695  gcc-4.8.4.tar.bz2
+sha256  2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd  gcc-4.9.2.tar.bz2
+# No hash for the ARC variant, comes from the github-helper:
+none    xxx                                                               gcc-arc-2014.12.tar.gz
-- 
1.9.1
