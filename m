From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 13:13:36 -0300
Subject: [Buildroot] [PATCH 3/3] grub2: add hash
In-Reply-To: <1425399216-3522-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425399216-3522-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425399216-3522-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/grub2/grub2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 boot/grub2/grub2.hash

diff --git a/boot/grub2/grub2.hash b/boot/grub2/grub2.hash
new file mode 100644
index 0000000..8883905
--- /dev/null
+++ b/boot/grub2/grub2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	784ec38e7edc32239ad75b8e66df04dc8bfb26d88681bc9f627133a6eb85c458	grub-2.00.tar.xz
-- 
2.0.5
