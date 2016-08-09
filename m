From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:45:32 +0200
Subject: [Buildroot] [git commit] docs/manual: fix patch naming convention
Message-ID: <20160809134535.C7296821A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe7babeeb0a2be4a29bfbae275e0dd8fe972c711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise conflicts with the naming convention from previous section.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/patch-policy.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 5a1fe4f..e1df8b0 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -73,12 +73,12 @@ details.
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
-* Otherwise, patch files matching +<packagename>-*.patch+
-  are applied in alphabetical order.
+* Otherwise, patch files matching +*.patch+ are applied in alphabetical
+  order.
   So, to ensure they are applied in the right order, it is highly
   recommended to name the patch files like this:
-  +<packagename>-<number>-<description>.patch+, where +<number>+
-  refers to the 'apply order'.
+  +<number>-<description>.patch+, where +<number>+ refers to the
+  'apply order'.
 
 . If +BR2_GLOBAL_PATCH_DIR+ is defined, the directories will be
   enumerated in the order they are specified. The patches are applied
