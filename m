From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 21:57:49 +0100
Subject: [Buildroot] [git commit] grub2: add hash
Message-ID: <20150303212044.0945C7FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf554b96022a460d160e8caa272fab853ba20c29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/grub2/grub2.hash b/boot/grub2/grub2.hash
new file mode 100644
index 0000000..8883905
--- /dev/null
+++ b/boot/grub2/grub2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	784ec38e7edc32239ad75b8e66df04dc8bfb26d88681bc9f627133a6eb85c458	grub-2.00.tar.xz
