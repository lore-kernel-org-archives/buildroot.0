From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:16:47 +0100
Subject: [Buildroot] [git commit] arch: remove the BR2_GCC_TARGET_TUNE option
Message-ID: <20141106233447.593F7A3309@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc48f2312e541dbc40a819108ab0cfcccae5c5da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_GCC_TARGET_TUNE option is now unused, so we can get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1126d43..d62d887 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -217,9 +217,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	string
 
-config BR2_GCC_TARGET_TUNE
-	string
-
 config BR2_GCC_TARGET_ARCH
 	string
 
