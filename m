From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Jul 2015 20:51:21 +0200
Subject: [Buildroot] [PATCH 30/32] orbit: add hash file
In-Reply-To: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1438023083-19010-30-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/orbit/orbit.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/orbit/orbit.hash

diff --git a/package/orbit/orbit.hash b/package/orbit/orbit.hash
new file mode 100644
index 0000000..91eba3c
--- /dev/null
+++ b/package/orbit/orbit.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	42b0357041b4bdb051cb1a56cf73e3c2b2a2be207d431f70b4955465ad94b6a6  orbit-2.2.3-1.src.rock
-- 
2.1.4
