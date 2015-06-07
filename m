From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  7 Jun 2015 11:37:15 +0200
Subject: [Buildroot] [PATCH 2/6] package/libsvg-cairo: add hash file
In-Reply-To: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
References: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1433669839-21599-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libsvg-cairo/libsvg-cairo.hash | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 package/libsvg-cairo/libsvg-cairo.hash

diff --git a/package/libsvg-cairo/libsvg-cairo.hash b/package/libsvg-cairo/libsvg-cairo.hash
new file mode 100644
index 0000000..fba96de
--- /dev/null
+++ b/package/libsvg-cairo/libsvg-cairo.hash
@@ -0,0 +1,5 @@
+# From http://cairographics.org/snapshots/libsvg-cairo-0.1.6.tar.gz.md5
+md5 d79da7b3a60ad8c8e4b902c9b3563047  libsvg-cairo-0.1.6.tar.gz
+
+# Locally calculated
+sha256 a380be6a78ec2938100ce904363815a94068fca372c666b8cc82aa8711a0215c libsvg-cairo-0.1.6.tar.gz
-- 
2.4.2
