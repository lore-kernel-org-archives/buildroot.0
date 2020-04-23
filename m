From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:17:16 +0200
Subject: [Buildroot] [git commit] package/libva-utils: add upstream sha1 hash
Message-ID: <20200423200847.3A0708FC83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0329b979340a31a01b5176ddd4df9fde3f1b69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformat remaining hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-utils/libva-utils.hash | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index f6b10f84fb..45bbbf8517 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,5 @@
+# From https://github.com/intel/libva-utils/releases/download/2.7.1/libva-utils-2.7.1.tar.bz2.sha1sum
+sha1  9e86f45f76c169e7d376ab757d5bf14b7641475b  libva-utils-2.7.1.tar.bz2
 # Locally computed
-sha256 ffcd698a7d4312750d7c9338ba6b26774c7028ee6f9f3cbbf34c122c05bcea9a  libva-utils-2.7.1.tar.bz2
-sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
+sha256  ffcd698a7d4312750d7c9338ba6b26774c7028ee6f9f3cbbf34c122c05bcea9a  libva-utils-2.7.1.tar.bz2
+sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
