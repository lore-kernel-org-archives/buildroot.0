From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 17:43:19 +0200
Subject: [Buildroot] [git commit] qemu: add hash file
Message-ID: <20150423154328.2EFD07F8F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d78dd4b672268f68c71d71c550f3bc6c7ea73a08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
new file mode 100644
index 0000000..15962af
--- /dev/null
+++ b/package/qemu/qemu.hash
@@ -0,0 +1,2 @@
+# Locally computed, tarball verified with GPG signature
+sha256 4617154c6ef744b83e10b744e392ad111dd351d435d6563ce24d8da75b1335a0 qemu-2.2.1.tar.bz2
