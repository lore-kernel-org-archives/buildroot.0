From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 23:03:41 +0200
Subject: [Buildroot] [git commit] libfreeimage: add hash for license files
Message-ID: <20180429210822.8C6018913D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fbe5ea7b1cf495645a38dde4c422dccacd67faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreeimage/libfreeimage.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libfreeimage/libfreeimage.hash b/package/libfreeimage/libfreeimage.hash
index 4e69508be9..eded0297ec 100644
--- a/package/libfreeimage/libfreeimage.hash
+++ b/package/libfreeimage/libfreeimage.hash
@@ -1,2 +1,5 @@
 # Locally computed
 sha256 fbfc65e39b3d4e2cb108c4ffa8c41fd02c07d4d436c594fff8dab1a6d5297f89 FreeImage3170.zip
+sha256 d51615a1a47f1ddbb027920d60d3fc30a00e1284c795a47857883e641349fadf license-gplv2.txt
+sha256 084be110e3e8757d8e6945cda1fbc7e5073bbe688dc19b92c0d8440155d8e282 license-gplv3.txt
+sha256 0bb9a3123297c73ae6e19c70459fb0e58f313f67ca63176fd43f8e77668b8243 license-fi.txt
