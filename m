From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:47:17 +0200
Subject: [Buildroot] [git commit] package/python-matplotlib: rewrap
 Config.in help text
Message-ID: <20190602201238.3379981354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2311987335b75a54375ef4cd0e3698684d37911b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wrapping looked somewhat arbitrary, and not optimized to fill in
the 72 characters we allow.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-matplotlib/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 13a5c74ec4..99ad30aa08 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -13,11 +13,10 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_ZLIB # runtime
 	help
-	  Matplotlib strives to produce publication
-	  quality 2D graphics for interactive graphing,
-	  scientific publishing, user interface
-	  development and web application servers targeting
-	  multiple user interfaces and hardcopy output
+	  Matplotlib strives to produce publication quality 2D
+	  graphics for interactive graphing, scientific publishing,
+	  user interface development and web application servers
+	  targeting multiple user interfaces and hardcopy output
 	  formats.
 
 	  https://matplotlib.org/
