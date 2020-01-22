From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:53 +0100
Subject: [Buildroot] [PATCH 21/26] package/dhcpdump: add hash for license
 file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-22-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/dhcpdump/dhcpdump.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
index 36040c8a5d..358a6f01d2 100644
--- a/package/dhcpdump/dhcpdump.hash
+++ b/package/dhcpdump/dhcpdump.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
+sha256 bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
-- 
2.20.1
