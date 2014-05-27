From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 22:07:50 +0200
Subject: [Buildroot] [git commit] manual: explicitize manual license
Message-ID: <20140527200851.3CC2D9CB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2df721b2be9eacc1d63829c109b71c341acef7a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

People reading the Buildroot manual online cannot immediately know what its
license is (unlike reading it from within the source tree). To avoid any
discussion, explicitize this in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 94259f7..3225520 100644
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
 
