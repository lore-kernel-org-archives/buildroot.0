From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 15:29:06 -0300
Subject: [Buildroot] [PATCH 3/3] libsoup: add hash file
In-Reply-To: <1428431346-13658-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428431346-13658-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428431346-13658-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsoup/libsoup.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsoup/libsoup.hash

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
new file mode 100644
index 0000000..2eb86c4
--- /dev/null
+++ b/package/libsoup/libsoup.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.48/libsoup-2.48.0.sha256sum
+sha256	ea34dd64fe44343445daf6dd690d0691e9d973468de44878da97371c16d89784	libsoup-2.48.0.tar.xz
-- 
2.0.5
