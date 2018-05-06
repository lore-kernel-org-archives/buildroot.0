From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:01:39 +0200
Subject: [Buildroot] [git commit] libmad: add hash for license file
Message-ID: <20180506071548.098E58A40E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814d1f8bd2228cc5300855bc01b1f77b6d801226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/libmad.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmad/libmad.hash b/package/libmad/libmad.hash
index 173399f7ff..8b7859395f 100644
--- a/package/libmad/libmad.hash
+++ b/package/libmad/libmad.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad-0.15.1b.tar.gz
 sha256  0e21f2c6b19337d0b237dacc04f7b90a56be7f359f4c9a2ee0b202d9af0cfa69  frame_length.diff
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
