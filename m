From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:48 +0200
Subject: [Buildroot] [PATCH 001/121] package/at91bootstrap: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <5375395bb8adb2ba08b148d702afb01c1f41f553.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap/at91bootstrap.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 boot/at91bootstrap/at91bootstrap.hash

diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
new file mode 100644
index 0000000..0c4ef5f
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
-- 
2.7.4
