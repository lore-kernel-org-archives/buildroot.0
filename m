From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Dec 2009 15:23:10 +0100
Subject: [Buildroot] [git commit master] Config.in: bump version
Message-ID: <20091201142339.D3316777B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1545cb4faf38134c1e1800feaf5af7ed2cb2de9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index b4ed729..9a11043 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.11-rc2"
+	default "2009.11"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
