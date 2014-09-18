From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:42:02 +0200
Subject: [Buildroot] [git commit] btrfs-progs: add hash
Message-ID: <20140918195021.114EC9D6E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b92d3ac1f0533c8de9ca090a5b54c6a04d296831
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/btrfs-progs/btrfs-progs.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
new file mode 100644
index 0000000..b22acf3
--- /dev/null
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs/sha256sums.asc
+sha256	9a7651df6c0430b75fa0637519ca5be29a756684dada241b4398007ae3cb0b5e	btrfs-progs-v3.16.tar.xz
