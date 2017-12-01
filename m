From: Julius Kriukas <julius@kriukas.lt>
Date: Sat,  2 Dec 2017 00:30:20 +0200
Subject: [Buildroot] [PATCH] omxplayer: add hash for license file
Message-ID: <20171201223020.14573-1-julius@kriukas.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
---
 package/omxplayer/omxplayer.hash | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
index 3715e48488..ad084e2643 100644
--- a/package/omxplayer/omxplayer.hash
+++ b/package/omxplayer/omxplayer.hash
@@ -1,3 +1,6 @@
-# Locally computed
+# Locally computed:
 sha1    258316ff94a1f1e5e47a5bb1a28d324ab08871a9                          omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
 sha256  c16498258ee78c59f9705b621e4b5b7b0673e1687d94681f9dc52451b1ceba48  omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
+
+# Hash for license file:
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.11.0
