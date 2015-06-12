From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:19:52 +0200
Subject: [Buildroot] [git commit] support: remove outdated note re. Python 3
	support
Message-ID: <20150612192737.C3C3E80410@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=954c09ae62374d0917ce65581d60e50df8747191
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kconfiglib now runs as either Python 2 or Python 3.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/gen-manual-lists.py |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

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
 
