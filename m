From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Mar 2021 14:39:35 +0100
Subject: [Buildroot] [git commit] package/rust-bin: add i586 download hash
Message-ID: <20210306132202.97CD97F8A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32b27fd1ac9edce33d32c291a7baa8a366d1ff31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13576

  ERROR: No hash found for rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz

Reported-by: ingineru_de_sistem at yahoo.com
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust-bin/rust-bin.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index cc3ea89b1f..46c023e62f 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -16,6 +16,9 @@ sha256  5bc6c5dfcc9c345c3f7af519df8ac77c2b0938ea32aa7949f589bec2c7cd3a22  rust-s
 # From https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
 sha256  da71ec82973eb6fdf67de25b5a39d9cb4b943ec2c43de570f4785a3a79036430  rust-std-1.48.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  d700751756d9b6e7881dd3a5f67bec1b998b3e278a113f4de2125f4281deaf5c  rust-std-1.48.0-i586-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz.asc
 sha256  d4ea5ca6f9c8f9092b50c879f1d9a2620486f08020fa4cac227743a19f6e8cdf  rust-std-1.48.0-i686-unknown-linux-gnu.tar.xz
