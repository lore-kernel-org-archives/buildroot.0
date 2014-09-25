From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 25 Sep 2014 17:09:20 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: add hash
Message-ID: <1411657760-63338-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openvmtools: add hash

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/openvmtools/openvmtools.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/openvmtools/openvmtools.hash

diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
new file mode 100644
index 0000000..98b5438
--- /dev/null
+++ b/package/openvmtools/openvmtools.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/open-vm-tools/files/open-vm-tools/stable-9.4.x/
+md5	3969daf1535d34e1c5f0c87a779b7642	open-vm-tools-9.4.6-1770165.tar.gz
+sha1	5d862148167cb0a56219d018e7d8d965118e1dde	open-vm-tools-9.4.6-1770165.tar.gz
-- 
1.7.10.4
