From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:04 -0300
Subject: [Buildroot] [PATCH 003/113] drbd-utils: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/drbd-utils/drbd-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/drbd-utils/drbd-utils.hash

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
new file mode 100644
index 0000000..c9894cd
--- /dev/null
+++ b/package/drbd-utils/drbd-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	2c531655d0d198a6af055edbc90f232538c2a3d2ce3fe137d03d06de4c1166d7	drbd-utils-8.9.1.tar.gz
-- 
2.3.6
