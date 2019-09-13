From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 13 Sep 2019 23:13:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/links: add hash for COPYING file
Message-ID: <20190913211353.28334-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/links/links.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/links/links.hash b/package/links/links.hash
index 971ed6308c..13b858e4af 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 3bddcd4cb2f7647e50e12a59d1c9bda61076f15cde5f5dca6288b58314e6902d  links-2.20.tar.bz2
+sha256 92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
-- 
2.23.0
