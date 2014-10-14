From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:24:40 -0300
Subject: [Buildroot] [PATCH 4/4] kmod: add hash file
In-Reply-To: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329080-25292-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kmod/kmod.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/kmod/kmod.hash

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
new file mode 100644
index 0000000..8244fd9
--- /dev/null
+++ b/package/kmod/kmod.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
+sha256	e16e57272b54acb219c465b334715cfdddb5d97ff5d8948d4830ca1a372a868e	kmod-18.tar.xz
-- 
2.0.4
