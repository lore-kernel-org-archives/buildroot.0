From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 23:22:08 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130829221536.0913B9B5C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13ce6ddf5980819abdab21d6824a3e1c908872e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2fc965e..8c7c23a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2013.08, Not yet released:
+
+	Fixes all over the tree.
+
+	External toolchain lib32/lib64 handling, ABI name for EABIhf,
+	misc fixes for generatelocales, apply-patches and module
+	stripping.
+
+	Top level menu names reordered and renamed for clarity.
+
+	Updated/fixed packages: acl, attr, bash, directfb, dvb-apps,
+	kexec, kmod, libbsd, linux-fusion, mesa3d, minidlna, openssh,
+	openssl, pulseaudio, python-setuptools, qt5, qt5webkit, redis,
+	strongswan, sunxi-mali
+
 2013.08-rc2, Released August 16th 2013:
 
 	Documentation improvements.
