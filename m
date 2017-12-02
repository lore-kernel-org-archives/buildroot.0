From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:53:07 +0100
Subject: [Buildroot] [git commit] omxplayer: add hash for license file
Message-ID: <20171202134745.A02C981EA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96bf32dcfb1585daa279c8c747210aad94386363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omxplayer/omxplayer.hash | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
index 3715e48..ad084e2 100644
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
