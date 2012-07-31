From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:47:31 +0200
Subject: [Buildroot] [git commit] Mention Device Tree feature in CHANGES
Message-ID: <20120731214744.8943896FD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdbc2f4059e96eb642c5f973e08acd33a2659f2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4a11719..e314c84 100644
--- a/CHANGES
+++ b/CHANGES
@@ -34,9 +34,15 @@
 	By default, automatic detection of the number of compilation
 	jobs to use, depending on the number of CPUs available.
 
-	Improvements to support systems with static libraries only
+	Improvements to generate systems with static libraries only
 	(infrastructure and package fixes).
 
+	Add proper support in the Linux kernel package to generate
+	Device Tree Blobs or combined Device Tree / Kernel
+	images. This will be useful on Microblaze, PowerPC and ARM,
+	which are architectures making extensive use of the Device
+	Tree.
+
 	Updated/fixed packages: audiofile, autoconf, automake, axel,
 	barebox, bash, beecrypt, berkeleydb, bind, bison, bluez_utils,
 	bonnie, boost, busybox, bsdiff, bwm-ng, bzip2, cifs-utils,
