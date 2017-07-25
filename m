From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 23:56:02 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] orc: update project url
Message-ID: <20170725222212.4136281D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cf252f77f4343985e676a4b1daa0b9ed95e5854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

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
