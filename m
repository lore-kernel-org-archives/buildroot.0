From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:43:57 +0200
Subject: [Buildroot] [git commit] libhid: add hash for license file
Message-ID: <20180501094623.77C288A521@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51367f2bd8bec3942f228517baa624b0d548c507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhid/libhid.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libhid/libhid.hash b/package/libhid/libhid.hash
index 7a843b60f4..933ba22a92 100644
--- a/package/libhid/libhid.hash
+++ b/package/libhid/libhid.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  f6809ab3b9c907cbb05ceba9ee6ca23a705f85fd71588518e14b3a7d9f2550e5  libhid-0.2.16.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
