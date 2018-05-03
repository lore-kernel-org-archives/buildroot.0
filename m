From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 May 2018 17:07:45 +0200
Subject: [Buildroot] [PATCH 1/1] libllcp: add hash for license file
Message-ID: <20180503150745.11470-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libllcp/libllcp.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libllcp/libllcp.hash b/package/libllcp/libllcp.hash
index 47c909f1e6..e6f6301731 100644
--- a/package/libllcp/libllcp.hash
+++ b/package/libllcp/libllcp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 4336533304a11ecb3041d211ccecd7759b7c7aad4f44037721803e2da1094d22  libllcp-05dfa8003433a7070bfd8ae02efdb0203bbf34aa.tar.gz
+sha256 9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
-- 
2.14.1
