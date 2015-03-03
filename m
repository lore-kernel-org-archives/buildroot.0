From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 21:57:11 +0100
Subject: [Buildroot] [git commit] grub: add hash
Message-ID: <20150303212044.0084E7FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cce65ef5ef6fe3270648fa4a059cdf2ebfdeef8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/grub.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/boot/grub/grub.hash b/boot/grub/grub.hash
new file mode 100644
index 0000000..566dec8
--- /dev/null
+++ b/boot/grub/grub.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub/grub_0.97-68.dsc
+sha256	4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b	grub_0.97.orig.tar.gz
+sha256	a453489cf1fec5d311a0b76dea8c8b2ff67eee1a3eba6c06ab80864494d9773c	grub_0.97-68.diff.gz
