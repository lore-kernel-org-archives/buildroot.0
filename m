From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 20:54:34 +0100
Subject: [Buildroot] [git commit] manual/adding-packages-tips.txt: reword
	part about package name
Message-ID: <20140323195542.0E3529C1CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74af345cff8a98bbabad6b33ef124a1fe2eb1a99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-tips.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 73c25be..ceaba8e 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -31,7 +31,7 @@ using the following rules:
   +BR2_PACKAGE_FOO_BAR_BOO+);
 
 * the +*.mk+ file variable prefix is the upper case _package name_
-  `.` and `-` characters substituted with `_` (e.g.:
+  with `.` and `-` characters substituted with `_` (e.g.:
   +FOO_BAR_BOO_VERSION+).
 
 
