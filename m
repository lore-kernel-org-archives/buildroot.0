From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 22:30:43 +0200
Subject: [Buildroot] [PATCH 1/1] libical: add hash for license file
Message-ID: <20180430203043.14599-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libical/libical.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 5c42cdcc61..7edb29bd28 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	089ce3c42d97fbd7a5d4b3c70adbdd82115dd306349c1f5c46a8fb3f8c949592	libical-1.0.1.tar.gz
+sha256	c393726f82e6f21df5262110215f6a4382b32046d10afdcfcc49338aa7a191f2	LICENSE
-- 
2.14.1
