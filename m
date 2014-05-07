From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 21:53:58 +0200
Subject: [Buildroot] [git commit] httping: Fix a trivial typo in the menu
Message-ID: <20140507195442.F38F39CB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=069c26e5c28ffbd329a906310b2ac6ceef780151
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/httping/Config.in b/package/httping/Config.in
index cd97e72..6564415 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -1,4 +1,4 @@
-comment "httping needs a toolchain w/ char"
+comment "httping needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_HTTPING
