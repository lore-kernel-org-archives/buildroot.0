From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Aug 2013 00:29:27 +0200
Subject: [Buildroot] [git commit] gen-manual-lists.py: fixup after 2440385
	(config: reorder top-level menu)
Message-ID: <20130829222947.138AF9B614@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13d917aaffadc991360992c86031f2da67e07553
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/gen-manual-lists.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index ae1d4ff..3568843 100755
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -185,7 +185,7 @@ class Buildroot:
     list_info = {
         'target-packages': {
             'filename': "package-list",
-            'root_menu': "Package Selection for the target",
+            'root_menu': "Target packages",
             'filter': "_is_package",
             'sorted': True,
             'sub_menu': True,
