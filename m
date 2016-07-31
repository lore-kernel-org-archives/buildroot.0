From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 23:14:33 +0200
Subject: [Buildroot] [git commit] Config.in: fix typo
Message-ID: <20160731211815.AC5EB81E75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9312d63d9716bd4754aef6bd1aa6aa6a23961ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 7bb2a01..741a7ce 100644
--- a/Config.in
+++ b/Config.in
@@ -652,7 +652,7 @@ config BR2_STATIC_LIBS
 	bool "static only"
 	help
 	  Build and use only static libraries. No shared libraries will
-	  be instaled on the target. This potentially increases your
+	  be installed on the target. This potentially increases your
 	  code size and should only be used if you know what you are
 	  doing. Note that some packages may not be available when this
 	  option is enabled, due to their need for dynamic library
