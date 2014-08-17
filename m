From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] website/download: update daily snapshot
	section
Message-ID: <20140817191116.0EB5C9D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dde85015d0e7d3e36e7a3ce03736d62a8d0ebf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch makes some minor changes to the download page of the website:
- don't capitalize Daily Snapshots as there is no reason to.
- remove extra link to daily snapshots, as this link is already available on
  the line below.
- add a link to the latest snapshot
- avoid 'Click here', especially if 'here' is not clickable

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/download.html |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/docs/download.html b/docs/download.html
index 74f1325..f8cb7e2 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -30,17 +30,18 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
 
 <p>
 
-You can also obtain <a href="/downloads/snapshots/">Daily
-Snapshots</a> of the latest Buildroot source tree if you want to to
-follow development, but cannot or do not wish to use Git.
+You can also obtain daily snapshots of the latest Buildroot source tree if you
+want to follow development, but cannot or do not wish to use Git.
 
 <ul>
-	<li> Click here to <a href="downloads/snapshots/">Daily Snapshots</a>.
+	<li>You can download the
+	<a href="downloads/snapshots/buildroot-snapshot.tar.bz2">latest snapshot
+	</a> or view recent <a href="downloads/snapshots/">daily snapshots</a>.
 	</li>
 
-	<li> Click here to <a href="http://git.buildroot.net/buildroot">browse the source tree</a>.
+	<li>You can also <a href="http://git.buildroot.net/buildroot">browse the
+	source tree online</a>.
 	</li>
-
 </ul>
 
 
