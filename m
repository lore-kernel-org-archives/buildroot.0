From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:53:41 +0200
Subject: [Buildroot] [PATCH 5/5] package/cloop: add hash
In-Reply-To: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429440821-2578-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cloop/cloop.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/cloop/cloop.hash

diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
new file mode 100644
index 0000000..9acbceb
--- /dev/null
+++ b/package/cloop/cloop.hash
@@ -0,0 +1,2 @@
+# From http://debian-knoppix.alioth.debian.org/packages/sources/cloop/cloop_2.634-1.dsc
+sha256	d6d03e2368e19f9c6c3a313e9c34cf0620d129ce26132a8805580d953769dbbd	cloop_2.634-1.tar.gz
-- 
1.7.10.4
