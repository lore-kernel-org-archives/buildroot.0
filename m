From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 08:09:01 +0100
Subject: [Buildroot] [git commit] linux: mention 3.x.y kernels in 'custom
	version' help
Message-ID: <20131027072650.E843A9BBC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6bb2b50f9cd458c9baa3ef5bd439d5dbc16363d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(also fix grammatical error versions -> version)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 32426a3..e44d788 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -37,8 +37,8 @@ config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
-	  This option allows to use a specific 2.6.x or 2.6.x.y
-	  official versions, as available on kernel.org
+	  This option allows to use a specific official version from
+	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	bool "Custom tarball"
