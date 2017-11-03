From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:51 +0100
Subject: [Buildroot] [PATCH 16/31] package/libglib2: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-17-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libglib2/libglib2.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index fb9321e397..d2f169c378 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,4 @@
 # https://download.gnome.org/sources/glib/2.54/glib-2.54.2.sha256sum
 sha256  bb89e5c5aad33169a8c7f28b45671c7899c12f74caf707737f784d7102758e6c  glib-2.54.2.tar.xz
+# Locally computed
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
-- 
2.15.0
