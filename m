From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:33 +0200
Subject: [Buildroot] [PATCH v1 13/28] package/libunwind: replace utf-8 space
 by ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-13-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libunwind/libunwind.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 394bef1287..c8d44b44ac 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256 43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8  libunwind-1.3.1.tar.gz

-#?Hash for license file
+# Hash for license file
 sha256 6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
--
2.21.0
