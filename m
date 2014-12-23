From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:33:44 +0100
Subject: [Buildroot] [git commit] uemacs: fix "homepage" link
Message-ID: <20141223103354.CAF0E805F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7af98f27ab42acf180d6510f44b9cd31d981dd79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest version is only available from git.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uemacs/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uemacs/Config.in b/package/uemacs/Config.in
index f093218..cfe9805 100644
--- a/package/uemacs/Config.in
+++ b/package/uemacs/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_UEMACS
 	help
 	  A small emacs.
 
-	  ftp://ftp.kernel.org/pub/software/editors/uemacs/
+	  https://git.kernel.org/cgit/editors/uemacs/uemacs.git/
