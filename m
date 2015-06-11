From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jun 2015 00:36:31 +0200
Subject: [Buildroot] [PATCH 1/1] support: remove outdated note re. Python 3
	support
Message-ID: <1434062191-32403-1-git-send-email-ulfalizer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kconfiglib now runs as either Python 2 or Python 3.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 support/scripts/gen-manual-lists.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index d45810b..1e0e9bb 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -24,11 +24,6 @@
 ## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 ##
 
-## Note about python2.
-##
-## This script can currently only be run using python2 interpreter due to
-## its kconfiglib dependency (which is not yet python3 friendly).
-
 from __future__ import print_function
 from __future__ import unicode_literals
 
-- 
2.1.4
