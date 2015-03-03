From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 13:13:35 -0300
Subject: [Buildroot] [PATCH 2/3] grub: add hash
In-Reply-To: <1425399216-3522-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425399216-3522-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425399216-3522-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/grub/grub.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 boot/grub/grub.hash

diff --git a/boot/grub/grub.hash b/boot/grub/grub.hash
new file mode 100644
index 0000000..566dec8
--- /dev/null
+++ b/boot/grub/grub.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub/grub_0.97-68.dsc
+sha256	4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b	grub_0.97.orig.tar.gz
+sha256	a453489cf1fec5d311a0b76dea8c8b2ff67eee1a3eba6c06ab80864494d9773c	grub_0.97-68.diff.gz
-- 
2.0.5
