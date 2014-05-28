From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 00:03:49 +0200
Subject: [Buildroot] [git commit] manual: remove contributor list and add
	copyright
Message-ID: <20140528221103.0BA159CD6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baa41098aaf91f40db14fa7dde281c0c045a5f60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the mailing list [1], remove the limited explicit list of
contributors in favor of the general mention of 'The Buildroot developers'.
Add a copyright statement.
Move the generation info to the front.

[1] http://lists.busybox.net/pipermail/buildroot/2014-May/097589.html

[Peter: remove trailing +, minor rewording]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.txt |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 3225520..bf89af9 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -4,16 +4,15 @@
 = The Buildroot user manual
 :toc:
 
-Buildroot usage and documentation by Thomas Petazzoni. Contributions
-from Karsten Kruse, Ned Ludd, Martin Herren and others.
+Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
+{localtime} from git revision {sys:git rev-parse --short HEAD}
 
-The Buildroot manual is licensed under the GNU General Public License,
-version 2. Refer to file
-http://git.buildroot.org/buildroot/tree/COPYING[COPYING] in the Buildroot
+The Buildroot manual is written by the Buildroot developers.
+It is licensed under the GNU General Public License, version 2. Refer to the
+http://git.buildroot.org/buildroot/tree/COPYING[COPYING] file in the Buildroot
 sources for the full text of this license.
 
-Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
-{localtime} from git revision {sys:git rev-parse --short HEAD}
+Copyright (C) 2004-2014 The Buildroot developers
 
 image::logo.png[]
 
