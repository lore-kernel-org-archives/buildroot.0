From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 21:15:28 +0100
Subject: [Buildroot] [git commit] transmission: add url in Config.in
Message-ID: <20140119203153.2EF899B9EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8234e6e7fab77c8ca9dbb5d383aa23cf90264c58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use homepage rather than trac as pointed out by Yann]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 8d413c6..5d37309 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -10,6 +10,8 @@ config BR2_PACKAGE_TRANSMISSION
 	help
 	  Transmission is a cross-platform BitTorrent client.
 
+	  http://www.transmissionbt.com/
+
 if BR2_PACKAGE_TRANSMISSION
 
 config BR2_PACKAGE_TRANSMISSION_UTP
