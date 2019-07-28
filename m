From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 22:44:28 +0200
Subject: [Buildroot] [PATCH 1/7] package/ghostscript-fonts: add license hash
Message-ID: <20190728204434.12356-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ghostscript-fonts/ghostscript-fonts.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ghostscript-fonts/ghostscript-fonts.hash b/package/ghostscript-fonts/ghostscript-fonts.hash
index e9c7fdf999..e126f0e108 100644
--- a/package/ghostscript-fonts/ghostscript-fonts.hash
+++ b/package/ghostscript-fonts/ghostscript-fonts.hash
@@ -1,2 +1,4 @@
 # From http://sourceforge.net/projects/gs-fonts/files/gs-fonts/8.11%20%28base%2035%2C%20GPL%29/
 sha1	2a7198e8178b2e7dba87cb5794da515200b568f5	ghostscript-fonts-std-8.11.tar.gz
+# Locally computed
+sha256	0eb6f356119f2e49b2563210852e17f57f9dcc5755f350a69a46a0d641a0c401	ghostscript-fonts-std-8.11.tar.gz
-- 
2.20.1
