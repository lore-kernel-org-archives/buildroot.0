From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 4 Nov 2017 22:58:08 +0100
Subject: [Buildroot] [git commit] CHANGES: update with the explicit choice
 of backend in libssh2
Message-ID: <20171104215135.4DF22800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d1ff5ff8071369e31bc97b024dfa9b276d686e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 CHANGES | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5782fd6..e54c48a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,12 @@
 2017.11-rc1, To be released
 
+	libssh2: there is now an explicit choice of the backend to use
+	(mbedtls, gnutls or openssl). Previously, the choice was implicit
+	based on the TLS library that was selected. Now, it is possible to
+	choose the backend, which is important if several TLS libraries are
+	selected. The default is mbedtls, even if you didn't have mbedtls
+	selected before.
+
 	netsnmp: all MIB files are now installed, making the target filesystem a
 	bit bigger than before. To remove unneeded MIBS, you should use a
 	post-build script.
