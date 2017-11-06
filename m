From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 18:44:15 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent libssh2 changes
Message-ID: <20171106182336.69C0C800EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=354722ca0171d5b934554fa66e85d4866eb0898e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the revert to the old behavior, mbedtls is no longer the default.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7050af3..c247f7a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,8 +6,7 @@
 	(mbedtls, gnutls or openssl). Previously, the choice was implicit
 	based on the TLS library that was selected. Now, it is possible to
 	choose the backend, which is important if several TLS libraries are
-	selected. The default is mbedtls, even if you didn't have mbedtls
-	selected before.
+	selected.
 
 	netsnmp: all MIB files are now installed, making the target filesystem a
 	bit bigger than before. To remove unneeded MIBS, you should use a
