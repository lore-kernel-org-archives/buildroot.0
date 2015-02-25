From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:07:21 -0300
Subject: [Buildroot] [PATCH 4/5] vorbis-tools: add hash
In-Reply-To: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424869642-9080-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vorbis-tools/vorbis-tools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/vorbis-tools/vorbis-tools.hash

diff --git a/package/vorbis-tools/vorbis-tools.hash b/package/vorbis-tools/vorbis-tools.hash
new file mode 100644
index 0000000..8f40eda
--- /dev/null
+++ b/package/vorbis-tools/vorbis-tools.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/vorbis/SHA256SUMS
+sha256	a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc	vorbis-tools-1.4.0.tar.gz
-- 
2.0.5
