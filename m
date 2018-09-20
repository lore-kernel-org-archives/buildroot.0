From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:53 -0500
Subject: [Buildroot] [PATCH 08/14] package/bandwidthd: URL move to newline
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-8-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows scripting of URL checking to be simplier

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/bandwidthd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index a503da4..8a19733 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -25,8 +25,10 @@ config BR2_PACKAGE_BANDWIDTHD
 	  available on github that works on making BandwidthD's build
 	  process more compatible with buildroot's.
 
-	  Upstream: http://bandwidthd.sourceforge.net/
-	  Github fork: http://github.com/nroach44/bandwidthd
+	  Upstream:
+	  http://bandwidthd.sourceforge.net/
+	  Github fork:
+	  http://github.com/nroach44/bandwidthd
 
 if BR2_PACKAGE_BANDWIDTHD
 
-- 
1.9.1
