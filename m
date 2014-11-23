From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 14:19:59 +0100
Subject: [Buildroot] [PATCH 1/4] package/libtirpc: rename patches
In-Reply-To: <cover.1416748649.git.yann.morin.1998@free.fr>
References: <cover.1416748649.git.yann.morin.1998@free.fr>
Message-ID: <4346a7dee8f5a994789ebf27479b87c3ab5287cb.1416748649.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...port.patch => 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch} | 0
 ...ch => 0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch} | 0
 ...-IPv6-support-optional.patch => 0003-Make-IPv6-support-optional.patch} | 0
 ...sources.patch => 0004-Add-rpcgen-program-from-nfs-utils-sources.patch} | 0
 ...ch => 0005-Automatically-generate-XDR-header-files-from-.x-sour.patch} | 0
 ...ch => 0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libtirpc/{libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch => 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch} (100%)
 rename package/libtirpc/{libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch => 0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch} (100%)
 rename package/libtirpc/{libtirpc-0004-Make-IPv6-support-optional.patch => 0003-Make-IPv6-support-optional.patch} (100%)
 rename package/libtirpc/{libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch => 0004-Add-rpcgen-program-from-nfs-utils-sources.patch} (100%)
 rename package/libtirpc/{libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0005-Automatically-generate-XDR-header-files-from-.x-sour.patch} (100%)
 rename package/libtirpc/{libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (100%)

diff --git a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
rename to package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
diff --git a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
rename to package/libtirpc/0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
diff --git a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch b/package/libtirpc/0003-Make-IPv6-support-optional.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
rename to package/libtirpc/0003-Make-IPv6-support-optional.patch
diff --git a/package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0004-Add-rpcgen-program-from-nfs-utils-sources.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch
rename to package/libtirpc/0004-Add-rpcgen-program-from-nfs-utils-sources.patch
diff --git a/package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch
rename to package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
diff --git a/package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
similarity index 100%
rename from package/libtirpc/libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
rename to package/libtirpc/0006-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
-- 
1.9.1
