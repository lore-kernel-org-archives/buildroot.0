From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:13:26 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libarchive: add hash for
 license file
Message-ID: <20180823220615.2E66E8E4E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7213c2dc664e0820e103e60843e33626546614fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a3f5bf52b96827a78ae1cb5dd6b92abf25c76c5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 98a34ad36c..60ea0d1602 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  ed2dbd6954792b2c054ccf8ec4b330a54b85904a80cef477a1c74643ddafa0ce  libarchive-3.3.2.tar.gz
+sha256  ae6f35cc1979beb316e4d6431fc34c6fc59f0dd126b425c8552bb41c86e4825d  COPYING
