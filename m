From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 11:54:51 +0200
Subject: [Buildroot] [git commit] boot/opensbi: add hash file
Message-ID: <20190410095051.6ABCD87787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=941dbe1dc4aee94ad18c39348431b1e43aad6e4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All downloads performed by buildroot should be integrity-checked if
possible. Enable integrity-checking for the RISC-V OpenSBI sources by
adding a corresponding hash file.

Signed-off-by: Karsten Merker <merker@debian.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/opensbi/opensbi.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
new file mode 100644
index 0000000000..822c2dc9ce
--- /dev/null
+++ b/boot/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300 opensbi-v0.3.tar.gz
