From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:04 -0300
Subject: [Buildroot] [PATCH 06/11] btrfs-progs: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/btrfs-progs/btrfs-progs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/btrfs-progs/btrfs-progs.hash

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
new file mode 100644
index 0000000..b22acf3
--- /dev/null
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs/sha256sums.asc
+sha256	9a7651df6c0430b75fa0637519ca5be29a756684dada241b4398007ae3cb0b5e	btrfs-progs-v3.16.tar.xz
-- 
1.8.5.5
