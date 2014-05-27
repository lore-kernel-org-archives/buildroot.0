From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 27 May 2014 21:34:13 +0200
Subject: [Buildroot] [PATCH for 2014.05] manual: explicitize manual license
Message-ID: <a74f7fbcfd8f324f830e.1401219253@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

People reading the Buildroot manual online cannot immediately know what its
license is (unlike reading it from within the source tree). To avoid any
discussion, explicitize this in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/manual.txt |  5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -7,6 +7,11 @@
 Buildroot usage and documentation by Thomas Petazzoni. Contributions
 from Karsten Kruse, Ned Ludd, Martin Herren and others.
 
+The Buildroot manual is licensed under the GNU General Public License,
+version 2. Refer to file
+http://git.buildroot.org/buildroot/tree/COPYING[COPYING] in the Buildroot
+sources for the full text of this license.
+
 Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
 {localtime} from git revision {sys:git rev-parse --short HEAD}
 
