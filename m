From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 5 Mar 2018 17:02:33 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself for chromebook snow
Message-ID: <c7c717e6f5e3f07011b52f1d8f4756def98dc056.1520261245.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
Not sure how much is expected from a board maintainer,
but I think I could boot-test it and maybe bump kernel
version once in a while.

 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 41e1b54d99..44a82fa636 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -72,6 +72,8 @@ F:	package/libqmi/
 F:	package/modem-manager/
 
 N:	Alex Suykov <alex.suykov@gmail.com>
+F:	board/chromebook/snow/
+F:	configs/chromebook_snow_defconfig
 F:	package/vboot-utils/
 
 N:	Alexander Clouter <alex+buildroot@digriz.org.uk>
-- 
2.16.1
