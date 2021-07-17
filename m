From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:01:25 +0200
Subject: [Buildroot] [git commit] package/libtipc: renumber patches
Message-ID: <20210717072813.771A791087@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=bdad2d09e33b06cc8a895c3be5f3a2760b2d4bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 883a33ece55c6ef23c33a41196fddabadf140427 forgot to renumber
remaining patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ch => 0001-Automatically-generate-XDR-header-files-from-.x-sour.patch} | 0
 ...ch => 0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libtirpc/0003-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
similarity index 100%
rename from package/libtirpc/0003-Automatically-generate-XDR-header-files-from-.x-sour.patch
rename to package/libtirpc/0001-Automatically-generate-XDR-header-files-from-.x-sour.patch
diff --git a/package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch b/package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
similarity index 100%
rename from package/libtirpc/0004-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
rename to package/libtirpc/0002-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
