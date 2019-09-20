From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:25 +0000
Subject: [Buildroot] [PATCH 2/9] package/nss-mdns: add missing hash for
 LICENSE file
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-3-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/nss-mdns/nss-mdns.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nss-mdns/nss-mdns.hash b/package/nss-mdns/nss-mdns.hash
index 169c497bbe..ac47e33cb4 100644
--- a/package/nss-mdns/nss-mdns.hash
+++ b/package/nss-mdns/nss-mdns.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d	nss-mdns-0.10.tar.gz
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	LICENSE
-- 
2.20.1
