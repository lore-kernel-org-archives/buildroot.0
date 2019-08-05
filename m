From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:37:01 +0200
Subject: [Buildroot] [git commit] docs/manual: update pkg-kconfig doc about
 <pkg>-diff-config
Message-ID: <20190805203423.5BFAE8E37C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6d1f9584f98aeaa1bdf2cf483ce926d4d6a7d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Briefly states what the output of this target is about.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
[Thomas: improve wording]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-kconfig.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 982c1229ea..8f40ea6099 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -43,6 +43,12 @@ This snippet creates the following make targets:
   options that differ from the default values. It is not possible to
   use this target when fragment files are set.
 
+* +foo-diff-config+, which outputs the differences between the current
+  configuration and the one defined in the Buildroot configuration for
+  this kconfig package. The output is useful to identify the
+  configuration changes that may have to be propagated to
+  configuration fragments for example.
+
 and ensures that the source configuration file is copied to the build
 directory at the right moment.
 
