From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 19:30:30 +0200
Subject: [Buildroot] [git commit] libfcgi: add hash for license file
Message-ID: <20180429173110.6E6F88A3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c45999aced903658ed6d96515e584db1eded42b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfcgi/libfcgi.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 586ff1e7ad..98aa2ecf8f 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9	fcgi-2.4.0.tar.gz
+sha256	f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81	LICENSE.TERMS
