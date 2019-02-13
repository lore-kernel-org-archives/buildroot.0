From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Feb 2019 09:48:42 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for zynq_zybo_defconfig
Message-ID: <20190213084842.18937-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c17ba6db99..13f67f69f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1925,6 +1925,10 @@ F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/
 F:	package/qt5/qt5charts/
 
+N:	Sebastien Van Cauwenberghe <svancau@gmail.com>
+F:	board/digilent/zybo/
+F:	configs/zynq_zybo_defconfig
+
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
 F:	package/libbson/
-- 
2.20.1
