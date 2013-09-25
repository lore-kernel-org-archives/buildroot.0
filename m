From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Sep 2013 10:21:19 +0200
Subject: [Buildroot] [git commit] proftpd: needs mmu
Message-ID: <20130925092155.ED2409B880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1954c4e0c685d17db2c8d7ecdbd4feccfea5b77a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proftpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 7793713..18407d1 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  ProFTPD, a highly configurable FTP server.
 
