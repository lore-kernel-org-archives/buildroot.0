From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:36 -0300
Subject: [Buildroot] [PATCH 035/113] libplayer: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-35-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libplayer/libplayer.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libplayer/libplayer.hash

diff --git a/package/libplayer/libplayer.hash b/package/libplayer/libplayer.hash
new file mode 100644
index 0000000..6f13143
--- /dev/null
+++ b/package/libplayer/libplayer.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	aa5eeb54f773bc9cad2733e4a0b5870208fc7f75024515ea87e55f64653e9d65	libplayer-2.0.1.tar.bz2
-- 
2.3.6
