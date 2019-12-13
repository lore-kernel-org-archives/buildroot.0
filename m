From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Dec 2019 23:09:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/ljsyscall: add hash for license file
In-Reply-To: <20191213220912.18906-1-fontaine.fabrice@gmail.com>
References: <20191213220912.18906-1-fontaine.fabrice@gmail.com>
Message-ID: <20191213220912.18906-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ljsyscall/ljsyscall.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
index cb3bea455c..6fd7f6a519 100644
--- a/package/ljsyscall/ljsyscall.hash
+++ b/package/ljsyscall/ljsyscall.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-0.12.tar.gz
+sha256 c8e21d8e74afbe26c2c8e69b42327d3b48e602117f9ef7b22c31ddca6f46b1f2  COPYRIGHT
-- 
2.24.0
