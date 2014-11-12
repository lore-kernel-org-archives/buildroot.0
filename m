From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 22:31:39 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20141112222957.C8E14B441C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6896e82933f3b3fca082714b3ef8d571ea6378f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e7f310..79e0f58 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,29 @@
 
 	Fixes all over the tree and new features.
 
+	Toolchains: Use -mcpu / -march instead of -mtune. Support
+	additional ARC and sparc variants. Updated Code sourcery
+	and Linaro external toolchains.
+
+	Defconfigs: Freescale iMX6DL SabreSD, Minnowboard MAX, QEMU
+	powerpc64 pseries added and a number of updates to the
+	existing configurations.
+
+	Infrastructure: Buildroot is now less noisy when built with
+	the silent option (make -s).
+	A number of package infrastructure variables have been renamed
+	from *_OPT to *_OPTS for constency. Buildroot will complain if
+	the old names are used to assist in updating out of tree
+	packages.
+	Fixes for host systems where bash isn't located in /bin, and
+	older systems not supporting mktemp --tmpdir.
+	Various cleanups of users/groups in the default skeleton.
+	There is now an option to choose what shell /bin/sh points to.
+
+	Documentation: Various updates to the user manual. The
+	asciidoc documentation handling has now been extended so it
+	can be used by (BR2_EXTERNAL) packages.
+
 	Updated/fixed packages: acl, acpid, agentpp, aircrack-ng,
 	alsa-lib, alsamixergui, alsa-utils, apitrace, apr, apr-util,
 	argus, arptables, at, atftp, atk, attr, audiofile, aumix,
