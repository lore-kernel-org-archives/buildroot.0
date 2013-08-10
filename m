From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 10:24:33 +0200
Subject: [Buildroot] [git commit] manual: tips: document how to build the
	manual
Message-ID: <20130810082619.C61D89B2B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2a50dda7d7619b3e061009cc11791052de06cc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: A.R.D. <contact@team-ard.com>
Cc: Willy Lambert <lambert.willy@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/make-tips.txt |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index b4a9c12..e87bbf7 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -54,6 +54,23 @@ and target trees, the images and the toolchain):
  $ make clean
 --------------------
 
+.Generating the manual:
+
+The present manual sources are located in the 'docs/manual' directory.
+To generate the manual:
+
+---------------------------------
+ $ make manual-clean
+ $ make manual
+---------------------------------
+
+The manual outputs will be generated in 'output/docs/manual'.
+
+.Notes
+- +asciidoc+ is required to build the documentation (see:
+  xref:requirement-optional[]).
+- There is a known issue that you can't build it under Debian Squeeze.
+
 To delete all build products as well as the configuration:
 
 --------------------
