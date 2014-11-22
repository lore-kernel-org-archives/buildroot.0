From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:13:43 +0100
Subject: [Buildroot] [git commit] manual: Add newline before block code
Message-ID: <20141122191447.D01067FBB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d918e11dccaeecdfc7700ea392d739ec0b66772
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This won't change the output, it's only a style issue.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c145829..0ea03f9 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -191,15 +191,19 @@ construct rather than repeating the +depends on+ statement on the
 comment and other config options.
 
 The general format of a dependency +comment+ for package foo is:
+
 --------------------------
 foo needs a toolchain w/ featA, featB, featC
 --------------------------
 
 for example:
+
 --------------------------
 aircrack-ng needs a toolchain w/ largefile, threads
 --------------------------
+
 or
+
 --------------------------
 crda needs a toolchain w/ threads
 --------------------------
@@ -283,6 +287,7 @@ foo needs a Linux kernel to be built
 
 If there is a dependency on both toolchain options and the Linux
 kernel, use this format:
+
 --------------------------
 foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
 --------------------------
