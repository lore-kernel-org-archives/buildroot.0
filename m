From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:22 +0200
Subject: [Buildroot] [PATCH 7/9] package/fakeroot: add hash
In-Reply-To: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429448844-12598-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fakeroot/fakeroot.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fakeroot/fakeroot.hash

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
new file mode 100644
index 0000000..c9e1f0c
--- /dev/null
+++ b/package/fakeroot/fakeroot.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/f/fakeroot/fakeroot_1.18.4-2.debian.tar.gz
+sha256	0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2	fakeroot_1.18.4.orig.tar.bz2
-- 
1.7.10.4
