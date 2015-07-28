From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:46 -0300
Subject: [Buildroot] [PATCH 045/113] libxkbcommon: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-45-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxkbcommon/libxkbcommon.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libxkbcommon/libxkbcommon.hash

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
new file mode 100644
index 0000000..9cbe440
--- /dev/null
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -0,0 +1,3 @@
+# From http://lists.freedesktop.org/archives/wayland-devel/2014-October/017836.html
+md5	2e1faeafcc609c30af3a561a91e84158	libxkbcommon-0.5.0.tar.xz
+sha1	7127993bfb69e13cdff25fb8b3c8f26ce6be5bfa	libxkbcommon-0.5.0.tar.xz
-- 
2.3.6
