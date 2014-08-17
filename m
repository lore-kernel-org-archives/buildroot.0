From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual/getting started: rework 'Getting
	Buildroot' section
Message-ID: <20140817191116.1666A9D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afdd5cebe2a4a16930404437b0167232208158ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reworks the 'Getting Buildroot' section of the manual as follows:
- be more specific on the Buildroot release cycle
- refer to the download page of the website for details on snapshots and
  git, instead of duplicating the information.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/getting.txt |   26 ++++++++------------------
 1 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index d10ac43..3437f93 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -4,23 +4,13 @@
 [[getting-buildroot]]
 == Getting Buildroot
 
-Buildroot releases are made approximately every 3 months. Direct Git
-access and daily snapshots are also available, if you want more
-bleeding edge.
+Buildroot releases are made every 3 months, in February, May, August and
+November. Release numbers are in the format YYYY.MM, so for example
+2013.02, 2014.08.
 
-Releases are available at http://buildroot.net/downloads/[].
-
-The latest snapshot is always available at
-http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2[],
-and previous snapshots are also available at
-http://buildroot.net/downloads/snapshots/[].
-
-To download Buildroot using Git, you can simply follow the rules
-described on the "Accessing Git" page
-(http://buildroot.net/git.html[]) of the Buildroot website
-(http://buildroot.net[]).  For the impatient, here's a quick recipe:
-
----------------------
- $ git clone git://git.buildroot.net/buildroot
----------------------
+Release tarballs are available at http://buildroot.org/downloads/[].
 
+If you want to follow development, you can use the daily snapshots or
+make a clone of the Git repository. Refer to the
+http://buildroot.org/download[Download page] of the Buildroot website
+for more details.
