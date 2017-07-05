From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  5 Jul 2017 20:25:22 +0530
Subject: [Buildroot] [PATCH 2/7] gflags: add hash for license file
In-Reply-To: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1499266527-11091-2-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/gflags/gflags.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index b9eeb57..3cae2b0 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,2 +1,5 @@
 # Locally computed
 sha256	466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88	gflags-v2.2.0.tar.gz
+
+# Hash for license file:
+sha256 90d1f3701813c3cd65eee2dc736746fe46b465918f3f7d6d31463a2018b33fa5  COPYING.txt
-- 
2.7.4
