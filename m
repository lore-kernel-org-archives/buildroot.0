From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  3 Aug 2018 20:14:25 +0200
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version 2.28
In-Reply-To: <20180803181425.18106-1-romain.naour@gmail.com>
References: <20180803181425.18106-1-romain.naour@gmail.com>
Message-ID: <20180803181425.18106-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 81dd5ad5ed..85afd6fd6b 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  33189b3f10c88730a1f686fac794bc01f31765f12ffd75bc5e8a0f2a690d217a     glibc-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e.tar.gz
+sha256  877c7b4741501d1762af8ef1a2518bdf2d722947d2e8d48b203e2d83cc600bca     glibc-glibc-2.28.tar.gz
 # Locally calculated (fetched from Github)
 sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de     glibc-arc-2018.03-release.tar.gz
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d34b42b831..399cf395ce 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e
+GLIBC_VERSION = glibc-2.28
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.14.4
