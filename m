From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:35:04 +0200
Subject: [Buildroot] [git commit] mono: add Angelo SoB + upstream status on
	vasprintf related patch
Message-ID: <20150806063604.0820B817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=051dac93b3abad09a28a7f06e64a30c1d0545111
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Angelo is the author of the upstream patch, so it is safe to add his
SoB. This commit also adds the upstream status of the patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...4-fixing-initialization-of-have-vasprintf.patch |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/mono/0004-fixing-initialization-of-have-vasprintf.patch b/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
index e01a6f0..5564859 100644
--- a/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
+++ b/package/mono/0004-fixing-initialization-of-have-vasprintf.patch
@@ -5,6 +5,12 @@ Subject: [PATCH] Fixing initialization of have_vasprintf
 
 This patch initialize properly have_vasprintf in case vasprint function is found.
 Solves multiple definition of `vasprintf' error in case vasprint is not properly detected.
+
+Patch is upstream:
+
+   https://github.com/mono/mono/commit/40c171799b671718969ee28a02f92884d7fd181e
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 ---
  eglib/configure.ac | 1 +
  1 file changed, 1 insertion(+)
