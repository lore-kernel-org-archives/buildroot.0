From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 19:27:46 +0200
Subject: [Buildroot] [git commit] libenca: add hash for license file
Message-ID: <20180429173109.F14938A3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b317f612450c2cacf78540ca72572ffcf6df1008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libenca/libenca.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
index 1a03c8fa46..6c874b16a5 100644
--- a/package/libenca/libenca.hash
+++ b/package/libenca/libenca.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
+sha256 87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
