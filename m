From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:10:06 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] orc: update project url
Message-ID: <20170725222142.C5DB781E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e680be31ffef5318930017063e4970e5c0ae3569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The original url http://code.entropywave.com/orc is dead (server not found).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 036d235ade6a7577493385c97c63c599cdbcb735)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/orc/Config.in b/package/orc/Config.in
index 2470d99..7943ecf 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ORC
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
 
-	  http://code.entropywave.com/projects/orc/
+	  https://gstreamer.freedesktop.org/projects/orc.html
 
 comment "orc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
