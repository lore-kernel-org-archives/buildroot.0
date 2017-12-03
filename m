From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:06:32 +0100
Subject: [Buildroot] [git commit] package/avahi: configure option pygtk was
 renamed to pygobject
Message-ID: <20171203215915.C52A181338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4770baed4fa69e531b495286c7c1f2746e742fa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See corresponding commit:
https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65

Fixes
http://autobuild.buildroot.net/results/1e9/1e974c814ae4236077a869339be1143a9af7e5cd/
http://autobuild.buildroot.net/results/010/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca/
http://autobuild.buildroot.net/results/572/5721634ffa2a4544a82dda08c1fcea331ecdadaf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b89887b..c8f1af9 100644
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
