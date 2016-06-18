From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:06 +0200
Subject: [Buildroot] [PATCH 06/19] package/irqbalance: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-6-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the irqbalance tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/irqbalance/irqbalance.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/irqbalance/irqbalance.hash

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
new file mode 100644
index 0000000..032c491
--- /dev/null
+++ b/package/irqbalance/irqbalance.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3  irqbalance-v1.0.9.tar.gz
-- 
2.5.5
