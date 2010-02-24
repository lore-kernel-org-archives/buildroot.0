From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Feb 2010 22:59:32 +0100
Subject: [Buildroot] [git commit master] CHANGES: add
	ipsec-tools/libgtk2/madplay/netsnmp/pango/sylpheed/openmotif/xpdf
Message-ID: <20100224220118.AC1D377798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba50538cfa513f7155f9c7fd30df22047f6eb751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index e2165ec..4b8a544 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,14 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: busybox, qt
+	Updated/fixed packages: busybox, ipsec-tools, libgtk2, madplay,
+	netsnmp, pango, sylpheed, qt
+
+	Removed packages: openmotif, xpdf
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#165: openmotif does not build
 
 2010.02-rc2, Released February 23th, 2010:
 
-- 
1.6.3.3
