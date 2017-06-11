From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:16 +0200
Subject: [Buildroot] [PATCH 07/28] package/libbroadvoice: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbroadvoice/libbroadvoice.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libbroadvoice/libbroadvoice.hash

diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
new file mode 100644
index 000000000..e339aa443
--- /dev/null
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b68c91d5af6e493c3d4fc3be04825e109a7593fe4de8c18ec75546004eeb4749  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
-- 
2.11.0
