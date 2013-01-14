From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 12:23:54 +0100
Subject: [Buildroot] [git commit] links: needs mmu
Message-ID: <20130114112801.14EF39A04F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ada8725661f44800ba5a6bdc0b51704f50a1bd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/1c1456b19d7483475430b390291240733dbbf21b

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/links/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/links/Config.in b/package/links/Config.in
index 474aa6a..141eaf2 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LINKS
 	bool "links"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Graphics and text mode WWW browser (kind of like lynx).
 
