From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 15:29:05 -0300
Subject: [Buildroot] [PATCH 2/3] libsigc++: add hash file
In-Reply-To: <1428431346-13658-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428431346-13658-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428431346-13658-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigc/libsigc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsigc/libsigc.hash

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
new file mode 100644
index 0000000..21c0e99
--- /dev/null
+++ b/package/libsigc/libsigc.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.2/libsigc++-2.2.11.sha256sum
+sha256	9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626d6f67f940f1e4957	libsigc++-2.2.11.tar.xz
-- 
2.0.5
