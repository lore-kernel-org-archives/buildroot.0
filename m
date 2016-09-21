From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 12:19:21 +0200
Subject: [Buildroot] [PATCH 1/3] DEVELOPERS: fix removed packages or
	inexisting packages
Message-ID: <1474453163-16548-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elementary, libevas-generic-loaders and smtools3 no longer exist.

pygame doesn't exist, it's named python-pygame.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 605af96..43d011a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -812,8 +812,7 @@ F:	package/libcddb/
 F:	package/libmodbus/
 F:	package/ltris/
 F:	package/opentyrian/
-F:	package/pygame/
-F:	package/smtools3/
+F:	package/python-pygame/
 
 N:	Julien Corjon <corjon.j@ecagroup.com>
 F:	package/qt5/
@@ -1182,11 +1181,9 @@ F:	package/vnstat/
 N:	Romain Naour <romain.naour@gmail.com>
 F:	package/bullet/
 F:	package/efl/
-F:	package/elementary/
 F:	package/enlightenment/
 F:	package/expedite/
 F:	package/iqvlinux/
-F:	package/libevas-generic-loaders/
 F:	package/liblinear/
 F:	package/mcelog/
 F:	package/openpowerlink/
-- 
2.7.4
