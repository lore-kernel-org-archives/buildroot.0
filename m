From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:47:38 +0200
Subject: [Buildroot] [git commit] libdvbcsa: add hash for license file
Message-ID: <20180429165326.636018A35C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9163ac922477d16da5469d21d4dbd4cd1409d4c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvbcsa/libdvbcsa.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libdvbcsa/libdvbcsa.hash b/package/libdvbcsa/libdvbcsa.hash
index d8360e60bc..55ad51b595 100644
--- a/package/libdvbcsa/libdvbcsa.hash
+++ b/package/libdvbcsa/libdvbcsa.hash
@@ -2,3 +2,6 @@
 sha256	4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d	libdvbcsa-1.1.0.tar.gz
 # From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha1
 sha1	5f4640a7e93ae6494f24a881414e5c343f803365				libdvbcsa-1.1.0.tar.gz
+
+# Hash for license file:
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
