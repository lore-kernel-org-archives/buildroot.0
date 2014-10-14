From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:53 -0300
Subject: [Buildroot] [PATCH 16/16] mdadm: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mdadm/mdadm.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mdadm/mdadm.hash

diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
new file mode 100644
index 0000000..45b79dd
--- /dev/null
+++ b/package/mdadm/mdadm.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
+sha256	0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac644ffa3ae06e5b8c	mdadm-3.3.2.tar.xz
-- 
2.0.4
