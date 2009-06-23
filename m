From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Jun 2009 09:40:23 +0200
Subject: [Buildroot] [git commit] CHANGES: add resolved issues post-2009.05
Message-ID: <20090623074118.9DD1E76268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=533718a832ab5842cfdb0f27af4f24f384045f91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index aadc30c..8c77671 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2009.08, Not yet released:
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#241: device mapper + lvm2: build together
+	#367: linux kernel compile error for arm926t
+	#373: Support for building gstreamer without libxml
+	#383: gst-plugins-good: Allow soup plugin to be configured
+	#385: neon: Fix pkgconfig dependency
+	#391: gstreamer: Bump version to 0.10.23
+	#393: gst-plugins-base: Bump version to 0.10.23
+	#395: gst-plugins-bad: New package
+	#409: Bump php package to 5.2.10
+	#411: ipsec-tools: Bump version to 0.7.2
+
 2009.05, Released June 1st, 2009:
 
 	Fixes for dropbear & diffutils, bump linux-advanced 2.6.29.x
-- 
1.6.0.6
