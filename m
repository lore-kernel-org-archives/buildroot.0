From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:50:40 +0200
Subject: [Buildroot] [git commit] package/irqbalance: add .hash file
Message-ID: <20160618205843.0F97A81976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fd3f84c0281e46484337e9787c7c784259c0659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the irqbalance tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irqbalance/irqbalance.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
new file mode 100644
index 0000000..032c491
--- /dev/null
+++ b/package/irqbalance/irqbalance.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3  irqbalance-v1.0.9.tar.gz
