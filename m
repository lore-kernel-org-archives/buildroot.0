From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 22:20:11 +0200
Subject: [Buildroot] [PATCH 6 of 8 RFCv2 for 2014.08] website/download:
 update daily snapshot section
In-Reply-To: <patchbomb.1407874805@localhost>
References: <patchbomb.1407874805@localhost>
Message-ID: <093e0ba716de20b4a51a.1407874811@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes some minor changes to the download page of the website:
- don't capitalize Daily Snapshots as there is no reason to.
- remove extra link to daily snapshots, as this link is already available on
  the line below.
- add a link to the latest snapshot
- avoid 'Click here', especially if 'here' is not clickable

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/download.html |  13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff -r dd6d42a03816 -r 093e0ba716de docs/download.html
--- a/docs/download.html	Tue Aug 12 20:09:13 2014 +0200
+++ b/docs/download.html	Tue Aug 12 21:34:32 2014 +0200
@@ -30,17 +30,18 @@
 
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
 
 
