From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:21 -0400
Subject: [Buildroot] [PATCH 03/19] package/bzip2: add hash for license file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add a standard sha256 hash for the package itself.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/bzip2/bzip2.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bzip2/bzip2.hash b/package/bzip2/bzip2.hash
index 60b0a191ef..684fe73109 100644
--- a/package/bzip2/bzip2.hash
+++ b/package/bzip2/bzip2.hash
@@ -1,2 +1,6 @@
 # From http://www.bzip.org/downloads.html
 md5	00b516f4704d4a7cb50a1d97e6e8e15b	bzip2-1.0.6.tar.gz
+
+# Locally calculated
+sha256	a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd	bzip2-1.0.6.tar.gz
+sha256	4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204	LICENSE 
-- 
2.21.0
