From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Mar 2015 13:17:59 -0300
Subject: [Buildroot] [PATCH 27/28] x11r7/xutil_makedepend: add hash file
In-Reply-To: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427645880-8531-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427645880-8531-27-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xutil_makedepend/xutil_makedepend.hash

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
new file mode 100644
index 0000000..5965511
--- /dev/null
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -0,0 +1,2 @@
+# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2007
+sha256	f7a80575f3724ac3d9b19eaeab802892ece7e4b0061dd6425b4b789353e25425	makedepend-1.0.5.tar.bz2
-- 
2.0.5
