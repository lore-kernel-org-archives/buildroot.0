From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 22:20:07 +0200
Subject: [Buildroot] [PATCH 2 of 8 RFCv2 for 2014.08] manual: remove
	'Events' section
In-Reply-To: <patchbomb.1407874805@localhost>
References: <patchbomb.1407874805@localhost>
Message-ID: <384a21645bf29946ce02.1407874807@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The list of buildroot events is outdated, a sign that the manual is not the
best place to refer to timely things like events. The wiki page is better
suited for such information.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/get-involved.txt |  16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff -r 00ad338df278 -r 384a21645bf2 docs/manual/get-involved.txt
--- a/docs/manual/get-involved.txt	Wed Aug 06 19:48:39 2014 +0200
+++ b/docs/manual/get-involved.txt	Wed Aug 06 20:28:19 2014 +0200
@@ -103,19 +103,3 @@
 This page is reachable at http://elinux.org/Buildroot[].
 
 Currently, this page is mainly used as a _todo-list_.
-
-[[events]]
-=== Events
-
-==== Buildroot Developer Days aside ELC-E 2012 (November 3-4, 2012 - Barcelona)
-
-* Event page: http://elinux.org/Buildroot:DeveloperDaysELCE2012[]
-
-==== Buildroot presentation at LSM 2012 (July 12-14, 2012 - Geneva)
-
-* Announcement: http://lists.busybox.net/pipermail/buildroot/2012-May/053845.html[]
-
-==== Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012 - Brussels)
-
-* Announcement & agenda thread: http://lists.busybox.net/pipermail/buildroot/2012-January/049340.html[]
-* Report: http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html[]
