From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 23:23:51 +0200
Subject: [Buildroot] [PATCH 4/4] package/libvorbis: add hash file
In-Reply-To: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
References: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413408231-31696-4-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libvorbis/libvorbis.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libvorbis/libvorbis.hash

diff --git a/package/libvorbis/libvorbis.hash b/package/libvorbis/libvorbis.hash
new file mode 100644
index 0000000..3b997ba
--- /dev/null
+++ b/package/libvorbis/libvorbis.hash
@@ -0,0 +1,2 @@
+# From http://www.xiph.org/downloads/
+sha256 2f05497d29195dc23ee952a24ee3973a74e6277569c4c2eca0ec5968e541f372 libvorbis-1.3.4.tar.xz
-- 
2.1.2
