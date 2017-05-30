From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:20:02 +0200
Subject: [Buildroot] [git commit] exim: fix help text format
Message-ID: <20170530212121.7EA5882A07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54fd9482e9125822b4ec2f355c8ceb787794c2ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index 230ac86..aa50a86 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -8,8 +8,9 @@ config BR2_PACKAGE_EXIM
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_BERKELEYDB
 	help
-	  Exim is a message transfer agent (MTA) developed at the University of
-	  Cambridge for use on Unix systems connected to the Internet.
+	  Exim is a message transfer agent (MTA) developed at the
+	  University of Cambridge for use on Unix systems connected to
+	  the Internet.
 
 	  http://www.exim.org/
 
