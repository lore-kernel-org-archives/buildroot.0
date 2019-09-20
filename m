From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:22 +0000
Subject: [Buildroot] [PATCH 1/9] package/kmod: add missing hash for LICENSE
 file
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-2-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/kmod/kmod.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index b4beabff46..dea5c0c107 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -3,3 +3,4 @@ sha256 57bb22c8bb56435991f6b0810a042b0a65e2f1e217551efa58235b7034cdbb9d  kmod-26
 
 # Locally calculated
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
-- 
2.20.1
