From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:08:23 +0200
Subject: [Buildroot] [git commit] docs/manual: fix typo
Message-ID: <20150713150826.DDB6081955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7701e2bf754c773a9d6ef89923316413d09d5287
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-kernel-module.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index 39575f7..0a5ec5b 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -128,7 +128,7 @@ configure the build of the kernel module:
 * +FOO_MODULE_MAKE_OPTS+ may be set to contain extra variable definitions
   to pass to the Linux buildsystem.
 
-Yo may also reference (but you may *not* set!) those variables:
+You may also reference (but you may *not* set!) those variables:
 
  * +LINUX_DIR+ contains the path to where the Linux kernel has been
    extracted and built.
