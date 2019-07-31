From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:16:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/zeromq: fix
 sha256 hash
Message-ID: <20190731221358.DE86D82C8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=585e0a0ace926b7016948a17f004668262cf3213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Bump to version 4.3.2 did not update sha256 hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2312a83288c5bf7b546d7e2100aaac425ec85845)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeromq/zeromq.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 5b87c3ca15..689d960b28 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -2,6 +2,6 @@
 md5  2047e917c2cc93505e2579bcba67a573 zeromq-4.3.2.tar.gz
 sha1 e5253bff214f77621b3d29443f1aa6e5a106ffe5  zeromq-4.3.2.tar.gz
 # Locally computed
-sha256 bcbabe1e2c7d0eec4ed612e10b94b112dd5f06fcefa994a0c79a45d835cd21eb  zeromq-4.3.1.tar.gz
+sha256 ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c5378e22740f763  zeromq-4.3.2.tar.gz
 sha256 4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
 sha256 83f32abe61ee58ffb1b007412c08415168c052501dbf56d7a47aaaac52b03ef6  COPYING.LESSER
