From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:24 +0100
Subject: [Buildroot] [PATCH v2 15/15] reproducible: improve help text
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-16-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 5cf0c4d..2a81202 100644
--- a/Config.in
+++ b/Config.in
@@ -707,6 +707,11 @@ config BR2_REPRODUCIBLE
 	  this allows to generate exactly identical binaries from one
 	  build to the other, including on different machines.
 
+	  Some restrictions are known on current implementation:
+	    - Build paths ($OUTDIR and $TOPDIR) have to be the sames for all
+	      builds
+	    - Use of lzop is incompatible
+
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
-- 
1.9.1
