From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:08:46 +0200
Subject: [Buildroot] [git commit] libcuefile: add hash for license file
Message-ID: <20180429161010.54060890F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d29bb31a4ec48047cb8e2b9a0a1bb9b0e9551a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcuefile/libcuefile.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcuefile/libcuefile.hash b/package/libcuefile/libcuefile.hash
index 57db91f322..47c0c2fd76 100644
--- a/package/libcuefile/libcuefile.hash
+++ b/package/libcuefile/libcuefile.hash
@@ -2,3 +2,6 @@
 md5	1a6ac52e1080fd54f0f59372345f1e4e	libcuefile_r475.tar.gz
 # Calculated based on the hash above
 sha256	b681ca6772b3f64010d24de57361faecf426ee6182f5969fcf29b3f649133fe7	libcuefile_r475.tar.gz
+
+# Hash for license file:
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
