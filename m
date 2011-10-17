From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:27:15 +0200
Subject: [Buildroot] [git commit] openntpd: fix help text
Message-ID: <20111018052251.B79FA8D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=117550b68715b079cf2c5cafa634b22b4da06bdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Help text should be indented with <tab><space><space> and contain a link
to the upstream website.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openntpd/Config.in |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index e9c3bb5..32d0d8b 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
 	help
-	     OpenNTPD is an easy to use implementation of the Network Time
-	     Protocol. It provides the ability to sync the local clock
-	     to remote NTP servers and can act as NTP server itself,
-	     redistributing the local clock. It just works.
+	  OpenNTPD is an easy to use implementation of the Network Time
+	  Protocol. It provides the ability to sync the local clock
+	  to remote NTP servers and can act as NTP server itself,
+	  redistributing the local clock. It just works.
+
+	  http://www.openntpd.org/
