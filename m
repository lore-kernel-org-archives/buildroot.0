From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  6 Mar 2015 09:50:34 -0300
Subject: [Buildroot] [PATCH 6/6] gvfs: add hash
In-Reply-To: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425646234-22041-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gvfs/gvfs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gvfs/gvfs.hash

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
new file mode 100644
index 0000000..df21790
--- /dev/null
+++ b/package/gvfs/gvfs.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.16/gvfs-1.16.2.sha256sum
+sha256	6b0e62d27fe73844efb536689057b762fbce085984800c83395371306ec547f1	gvfs-1.16.2.tar.xz
-- 
2.0.5
