From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2013 09:34:54 +0100
Subject: [Buildroot] [git commit] manual: systemd does not require glib
Message-ID: <20131209083511.DF1299BF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0c4aa5ac50bd3c500e2224c7f6f7ca329c05c05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Shawn Landden <shawn@churchofgit.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 8912a81..89df3d9 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -371,7 +371,7 @@ can be chosen from +System configuration+, +Init system+:
    etc. +systemd+ will be useful on relatively complex embedded
    systems, for example the ones requiring D-Bus and services
    communicating between each other. It is worth noting that +systemd+
-   brings a fairly big number of large dependencies: +dbus+, +glib+
+   brings a fairly big number of large dependencies: +dbus+, +udev+
    and more. For more details about +systemd+, see
    http://www.freedesktop.org/wiki/Software/systemd.
 
