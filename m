From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:09:43 +0200
Subject: [Buildroot] [git commit] libarchive: add hash for license file
Message-ID: <20180429142028.1DA7C81D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3f5bf52b96827a78ae1cb5dd6b92abf25c76c5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
