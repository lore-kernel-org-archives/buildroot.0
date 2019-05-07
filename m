From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 23:30:25 +0200
Subject: [Buildroot] [PATCH v1 23/28] package/quota: replace utf-8 space by
 ascii character
In-Reply-To: <20190507213030.1542-1-ps.report@gmx.net>
References: <20190507213030.1542-1-ps.report@gmx.net>
Message-ID: <20190507213030.1542-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/quota/quota.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index dc58b2842c..d9f42e51c7 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -2,6 +2,6 @@
 md5	1c1dbd2cd3d680ccac661239b067e147	quota-4.05.tar.gz
 sha1	d23711f3b204e0a86b8378c32545c95fb149168d	quota-4.05.tar.gz

-#?Locally calculated
+# Locally calculated
 sha256	ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9	quota-4.05.tar.gz
 sha256	35b2d9797b83bce16076da9c3273f264f50b8d02f492ee32cd4c51ba6897bceb	COPYING
--
2.21.0
