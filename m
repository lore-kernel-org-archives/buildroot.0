From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 31 Mar 2018 00:29:14 +0530
Subject: [Buildroot] [PATCH 3/4] opus-tools: add hash for license file
In-Reply-To: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1522436355-5697-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1522436355-5697-3-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/opus-tools/opus-tools.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
index 185c94c..c7759e5 100644
--- a/package/opus-tools/opus-tools.hash
+++ b/package/opus-tools/opus-tools.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
 sha256 a2357532d19471b70666e0e0ec17d514246d8b3cb2eb168f68bb0f6fd372b28c  opus-tools-0.1.10.tar.gz
+
+# Hash for license file
+sha256 88021117568c64038175d7fb3b8286056f7cdb54f09dc806578f6bd9342c62cc  COPYING
-- 
2.7.4
