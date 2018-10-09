From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 10:11:47 +0200
Subject: [Buildroot] [git commit] ljlinenoise: fix upstream URL in Config.in
Message-ID: <20181009081141.8B6CB8E5B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05200ad01434ce297a166c6e1bebc8196c18f7dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current URL no longer exists, as detected by the new pkg-stats.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ljlinenoise/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index 61c80df0d1..e6b587e65d 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LJLINENOISE
 	  ljlinenoise is a pure LuaJIT port of linenoise,
 	  a small alternative to readline and libedit.
 
-	  http://fperrad.github.io/ljlinenoise/
+	  https://fperrad.frama.io/ljlinenoise/
 
 comment "ljlinenoise needs LuaJIT"
 	depends on !BR2_PACKAGE_LUAJIT
