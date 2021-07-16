From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 00:13:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtipc: renumber patches
Message-ID: <20210716221328.347351-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 883a33ece55c6ef23c33a41196fddabadf140427 forgot to renumber
remaining patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Automatically-generate-XDR-header-files-from-.x-sour.patch} | 0
 ...02-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libtirpc/{0003-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0001-Automatically-generate-XDR-header-files-from-.x-sour.patch} (100%)
 rename package/libtirpc/{0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (100%)

diff --git a/package/libtirpc/0003-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
similarity index 100%
rename from package/libtirpc/0003-Automatically-generate-XDR-header-files-from-.x-sour.patch
rename to package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
diff --git a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
similarity index 100%
rename from package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
rename to package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
-- 
2.30.2
