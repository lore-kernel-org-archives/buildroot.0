From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:41 +0100
Subject: [Buildroot] [PATCH 06/31] package/busybox: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-7-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/busybox/busybox.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 14d7d1c472..f3fc601efd 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,5 @@
 # From https://busybox.net/downloads/busybox-1.27.2.tar.bz2.sign
 md5	476186f4bab81781dab2369bfd42734e	busybox-1.27.2.tar.bz2
 sha1	11669e223cc38de646ce26080e91ca29b8d42ad9	busybox-1.27.2.tar.bz2
+# Locally computed
+sha256	bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548	LICENSE
-- 
2.15.0
