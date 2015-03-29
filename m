From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:57 -0300
Subject: [Buildroot] [PATCH 25/28] x11r7/xproto_fixesproto: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-25-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xproto_fixesproto/xproto_fixesproto.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/x11r7/xproto_fixesproto/xproto_fixesproto.hash

diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.hash b/package/x11r7/xproto_fixesproto/xproto_fixesproto.hash
new file mode 100644
index 0000000..d19f392
--- /dev/null
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.hash
@@ -0,0 +1,3 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1352
+md5	e7431ab84d37b2678af71e29355e101d	fixesproto-5.0.tar.bz2
+sha1	ab605af5da8c98c0c2f8b2c578fed7c864ee996a	fixesproto-5.0.tar.bz2
-- 
2.0.5
