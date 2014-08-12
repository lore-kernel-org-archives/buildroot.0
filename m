From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 22:20:12 +0200
Subject: [Buildroot] [PATCH 7 of 8 RFCv2 for 2014.08] manual/getting
 started: rework 'Getting Buildroot' section
In-Reply-To: <patchbomb.1407874805@localhost>
References: <patchbomb.1407874805@localhost>
Message-ID: <770cb501d536d02719c9.1407874812@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the 'Getting Buildroot' section of the manual as follows:
- be more specific on the Buildroot release cycle
- refer to the download page of the website for details on snapshots and
  git, instead of duplicating the information.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/getting.txt |  26 ++++++++------------------
 1 files changed, 8 insertions(+), 18 deletions(-)

diff -r 093e0ba716de -r 770cb501d536 docs/manual/getting.txt
--- a/docs/manual/getting.txt	Tue Aug 12 21:34:32 2014 +0200
+++ b/docs/manual/getting.txt	Tue Aug 12 21:11:54 2014 +0200
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
+Release tarballs are available at http://buildroot.org/downloads/[].
 
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
-
+If you want to follow development, you can use the daily snapshots or
+make a clone of the Git repository. Refer to the
+http://buildroot.org/download[Download page] of the Buildroot website
+for more details.
