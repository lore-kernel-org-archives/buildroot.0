From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 23:24:25 +0200
Subject: [Buildroot] [git commit] at: add sha256 for legal-info files
Message-ID: <20180923212853.D6DB188C78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32241123a5cebc4ea4f25ad05da704f5fc8ca505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Copyright and COPYING file sha256 are missing.

Add them calculating locally.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/at/at.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/at/at.hash b/package/at/at.hash
index e6eb26d818..530b1257c1 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256 f5c7c8226fab0bc4e2d16a55e04d4026f3452db51fc5cbcc4bb5a3c79a79f7ef  at-release_3.1.23.tar.gz
+
+sha256 01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
