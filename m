From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:13:55 +0200
Subject: [Buildroot] [PATCH 02/10] package/liblockfile: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liblockfile/liblockfile.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/liblockfile/liblockfile.hash

diff --git a/package/liblockfile/liblockfile.hash b/package/liblockfile/liblockfile.hash
new file mode 100644
index 0000000..7f7ee7f
--- /dev/null
+++ b/package/liblockfile/liblockfile.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libl/liblockfile/liblockfile_1.08-4.dsc
+sha256	d63293d5091d7fdc0259563694e4d68771310dbc4e70e188e6b68e7a776405cb	liblockfile_1.08.orig.tar.gz
+sha256	e1343c37b83722abdaa1b5d98e1696748ca134ad36752b8affebebd51ef78468	liblockfile_1.08-4.debian.tar.bz2
-- 
1.7.10.4
