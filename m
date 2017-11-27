From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Nov 2017 21:27:00 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/avahi: configure option pygtk
 was renamed to pygobject
Message-ID: <20171127202700.28697-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See corresponding commit:
https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65

Fixes
http://autobuild.buildroot.net/results/1e9/1e974c814ae4236077a869339be1143a9af7e5cd/
http://autobuild.buildroot.net/results/010/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca/
http://autobuild.buildroot.net/results/572/5721634ffa2a4544a82dda08c1fcea331ecdadaf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b89887b4c7..c8f1af9a9d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -77,7 +77,7 @@ AVAHI_CONF_OPTS = \
 	--disable-gtk \
 	--disable-gtk3 \
 	--disable-gdbm \
-	--disable-pygtk \
+	--disable-pygobject \
 	--disable-mono \
 	--disable-monodoc \
 	--disable-stack-protector \
-- 
2.11.0
