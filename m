From: Dagg <daggs@gmx.com>
Date: Sat,  4 Jun 2016 01:02:19 +0300
Subject: [Buildroot] [PATCH] odroid-mali: add missing hash for the second
	tar file
Message-ID: <20160603220219.7120-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg <daggs@gmx.com>
---
 package/odroid-mali/odroid-mali.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/odroid-mali/odroid-mali.hash b/package/odroid-mali/odroid-mali.hash
index 9c2d23a..74c94d7 100644
--- a/package/odroid-mali/odroid-mali.hash
+++ b/package/odroid-mali/odroid-mali.hash
@@ -1 +1,2 @@
 sha256 122fe75fc105fc2f7c00b7f075deca567f6a3e56b5c128b00cf3096073b96e66  odroid-mali-4a34d59cd6120db67dc11023344e382afbaf28da.tar.gz
+sha256 29d98ed4b8694b860d9289787c416faa847b0de26d36580a53add1752b4c2e9a  odroid-mali-46fe49f37e3506c6205ad8c50980eca9bfff11e3.tar.gz
-- 
2.8.3
