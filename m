From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual: remove 'Events' section
Message-ID: <20140817191115.DBFF09D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=429489c632c1ab0ac85c0c704b6650d0c58cf8ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The list of buildroot events is outdated, a sign that the manual is not the
best place to refer to timely things like events. The wiki page is better
suited for such information.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/get-involved.txt |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 0630d04..929560e 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -103,19 +103,3 @@ http://elinux.org[elinux.org].
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
