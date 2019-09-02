From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:35 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/giflib: add
 license hash
Message-ID: <20190902161338.9ED6C8A2B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05ab4a45aeaf8168728996d7af4c90f05d1b8206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f26a3fc92feea694b584eb887c9d7bfe5a9d8595)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giflib/giflib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index cdd7bbdecd..189dca9f19 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/giflib/files
 md5	2c171ced93c0e83bb09e6ccad8e3ba2b	giflib-5.1.4.tar.bz2
 sha1	5f1157cfc377916280849e247b8e34fa0446513f	giflib-5.1.4.tar.bz2
+# Locally computed
+sha256	0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e	COPYING
