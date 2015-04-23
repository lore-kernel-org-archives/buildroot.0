From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 23:01:47 +0200
Subject: [Buildroot] [git commit] package/gcc: add hashes
Message-ID: <20150423210626.7CFE2803E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcd6589021383d71e5df51d9b65529d5e9bbbfb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.hash     |    1 +
 package/gcc/gcc-initial/gcc-initial.hash |    1 +
 package/gcc/gcc.hash                     |   10 ++++++++++
 3 files changed, 12 insertions(+), 0 deletions(-)

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
index 0000000..5eec97f
--- /dev/null
+++ b/package/gcc/gcc.hash
@@ -0,0 +1,10 @@
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.5.4/sha512.sum
+sha512  78696b287d46aacd6f150920da376ea32f58ad9f0dafd2d3b7fa6dbdd8dd7afe659108d1dfaa5807617fc5248719f50b39c37ade0173ea5b9fec2091f4656115  gcc-4.5.4.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.7.4/sha512.sum
+sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e3f0f227eb43cdf90e0d34cde5abdc9ac892c1e111a911062a66c9189  gcc-4.7.4.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.4/sha512.sum
+sha512  b4c84ebd754c026029d706ef52c4242df4dcadc6a22cc5669b3aa37ac9dc25bc9cd9651fda83fb24dd5d17b1710e6865a35bb6c5cd9b95d0971717453935ae8e  gcc-4.8.4.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/sha512.sum
+sha512  e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e422640b79a27fed6fde91b0731732b94a0e2fbcd47344d6779f8ba1f4f9c  gcc-4.9.2.tar.bz2
+# No hash for the ARC variant, comes from the github-helper:
+none  xxx  gcc-arc-2014.12.tar.gz
