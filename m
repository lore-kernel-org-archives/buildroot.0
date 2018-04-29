From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:17:41 +0200
Subject: [Buildroot] [git commit] libdaemon: add hash for license file
Message-ID: <20180429162018.E55A48901E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d4d2a6c00bb13a29849d02a3db13d7271d4967e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdaemon/libdaemon.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdaemon/libdaemon.hash b/package/libdaemon/libdaemon.hash
index 8dbbb5a358..b510321828 100644
--- a/package/libdaemon/libdaemon.hash
+++ b/package/libdaemon/libdaemon.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834 libdaemon-0.14.tar.gz
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 LICENSE
