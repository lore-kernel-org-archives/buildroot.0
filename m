From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun,  5 May 2019 20:52:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] DEVELOPERS: Drop support for some
 packages from Petr Vorel
Message-ID: <20190505185259.7064-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 DEVELOPERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ccb0afaf6..e7e199dafd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1806,19 +1806,10 @@ N:	Petr Kulhavy <brain@jikos.cz>
 F:	package/linuxptp/
 
 N:	Petr Vorel <petr.vorel@gmail.com>
-F:	package/connman/
-F:	package/feh/
-F:	package/imlib2/
 F:	package/iproute2/
 F:	package/iputils/
-F:	package/libmbim/
-F:	package/libqmi/
 F:	package/linux-backports/
 F:	package/ltp-testsuite/
-F:	package/modem-manager/
-F:	package/network-manager/
-F:	package/ofono/
-F:	package/python-networkmanager/
 F:	support/kconfig/
 
 N:	Phil Eichinger <phil.eichinger@gmail.com>
-- 
2.21.0
