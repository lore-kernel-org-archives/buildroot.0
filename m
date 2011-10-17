From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:25:50 +0200
Subject: [Buildroot] [git commit] openntpd: style fix - don't capitalize in
	menu
Message-ID: <20111018052251.523F98E9B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16eebdc45f2304acf9a25f88847fc30e8a5b09dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openntpd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 6b8beb8..e9c3bb5 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_OPENNTPD
-	bool "OpenNTPD"
+	bool "openntpd"
 	help
 	     OpenNTPD is an easy to use implementation of the Network Time
 	     Protocol. It provides the ability to sync the local clock
