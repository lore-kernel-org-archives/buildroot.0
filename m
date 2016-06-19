From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:49 +0200
Subject: [Buildroot] [PATCH 002/121] package/at91dataflashboot: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <c3059d410565eace33373bc56893e067523671ac.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91dataflashboot/at91dataflashboot.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 boot/at91dataflashboot/at91dataflashboot.hash

diff --git a/boot/at91dataflashboot/at91dataflashboot.hash b/boot/at91dataflashboot/at91dataflashboot.hash
new file mode 100644
index 0000000..02e656c
--- /dev/null
+++ b/boot/at91dataflashboot/at91dataflashboot.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  2cfeb6a9236e1a743c8010f05e504dbc92169ef42d9a6cf7948954a577bfc386  DataflashBoot-1.05.tar.bz2
-- 
2.7.4
