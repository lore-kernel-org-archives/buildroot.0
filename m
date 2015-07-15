From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:11 -0300
Subject: [Buildroot] [PATCH 20/40] mplayer: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mplayer/mplayer.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/mplayer/mplayer.hash

diff --git a/package/mplayer/mplayer.hash b/package/mplayer/mplayer.hash
new file mode 100644
index 0000000..f1f9aca
--- /dev/null
+++ b/package/mplayer/mplayer.hash
@@ -0,0 +1,4 @@
+# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz.md5
+md5	39dd55f30eb5403f219a606e79a6648a	MPlayer-1.1.1.tar.xz
+# From http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz.sha1
+sha1	ba2f3bd1442d04b17b0143680850273d928689c1	MPlayer-1.1.1.tar.xz
-- 
2.3.6
