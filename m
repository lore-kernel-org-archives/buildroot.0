From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  5 Apr 2019 21:56:26 -0300
Subject: [Buildroot] [PATCH] DEVELOPERS: stop monitoring aer-inject
Message-ID: <20190406005626.10298-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

I left DATACOM and will unlikely have access to the hardware required to
test the package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bb7457985..01cb34057b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -433,7 +433,6 @@ N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <unixmania@gmail.com>
-F:	package/aer-inject/
 F:	package/busybox/
 F:	package/gtest/
 F:	package/initscripts/
-- 
2.20.1
