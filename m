From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:07:20 -0300
Subject: [Buildroot] [PATCH 3/5] libtheora: add hash
In-Reply-To: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424869642-9080-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtheora/libtheora.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libtheora/libtheora.hash

diff --git a/package/libtheora/libtheora.hash b/package/libtheora/libtheora.hash
new file mode 100644
index 0000000..daf2455
--- /dev/null
+++ b/package/libtheora/libtheora.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/theora/SHA256SUMS
+sha256	f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61	libtheora-1.1.1.tar.xz
-- 
2.0.5
