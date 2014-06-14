From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:09:18 +0200
Subject: [Buildroot] [git commit] fmc: fix package/Config.in
Message-ID: <20140614170925.72EE299EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e00c631ef4aa54bf452c192600c6aa2ba2e0fc74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9627d50..f43e985 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -922,7 +922,7 @@ endif
 	source "package/ebtables/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
-	source "package/fmc/Config.in
+	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
 	source "package/gesftpserver/Config.in"
