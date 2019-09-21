From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:59:34 +0200
Subject: [Buildroot] [git commit] package/kmod: add missing hash for COPYING
 file
Message-ID: <20190921135525.BC8268EE3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=decf2da2363489ca4d0efe8d5c5b3c4203e54e2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kmod/kmod.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index b4beabff46..dea5c0c107 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -3,3 +3,4 @@ sha256 57bb22c8bb56435991f6b0810a042b0a65e2f1e217551efa58235b7034cdbb9d  kmod-26
 
 # Locally calculated
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
