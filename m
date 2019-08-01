From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:36:08 +0200
Subject: [Buildroot] [git commit] package/libwebsock: add license hash
Message-ID: <20190801073838.38368813D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a011f34ca7632ba38c6701e360d3384a125ba29d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsock/libwebsock.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libwebsock/libwebsock.hash b/package/libwebsock/libwebsock.hash
index b94b738101..11b4f55f04 100644
--- a/package/libwebsock/libwebsock.hash
+++ b/package/libwebsock/libwebsock.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 34cf8376446e2371c9af47394043a30dc16af7ed5437d56bc6135c5dfda9ed22  libwebsock-3c1615eeadb0b582b63851073bfe3e5132f31ebc.tar.gz
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.lesser
