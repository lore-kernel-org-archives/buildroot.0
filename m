From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:27:16 +0200
Subject: [Buildroot] [git commit branch/next] package/kmod: add hash for
 license file
Message-ID: <20190530223346.A79F98E840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6de14a717d25344061d33a8b1a0addf805ef4d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 0e8f034e06..f970093cf1 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
 sha256 7165e6496656159dcb909a91ed708a0fe273a4b128b4b1dc997ccb5189eef1cd  kmod-25.tar.xz
+
+# Locally calculated
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
