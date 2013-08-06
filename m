From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 00:14:20 +0200
Subject: [Buildroot] [git commit] manual: mention LIBFOO_EXTRACT_CMDS
Message-ID: <20130806221415.9455D9B1C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d36ae7e8d70c987aa2e959c1c776542ce05d175
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Samuel: add precision about non-tar archive]
[Thomas: reword with more details. Fix commit title]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index faf70b1..fdca612 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -358,6 +358,13 @@ LIBFOO_VERSION = 2.32
 Now, the variables that define what should be performed at the
 different steps of the build process.
 
+* +LIBFOO_EXTRACT_CMDS+ lists the actions to be performed to extract
+  the package. This is generally not needed as tarballs are
+  automatically handled by Buildroot. However, if the package uses a
+  non-standard archive format, such as a ZIP or RAR file, or has a
+  tarball with a non-standard organization, this variable allows to
+  override the package infrastructure default behavior.
+
 * +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
   configure the package before its compilation.
 
