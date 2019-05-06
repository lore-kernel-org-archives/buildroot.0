From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 09:34:33 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: Drop support for some packages
 from Petr Vorel
Message-ID: <20190506073032.9EC138852E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fb1a0ca12bd8f48e791319969e029654a26583f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95ebfcbeea..5bfc4561c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1807,19 +1807,10 @@ N:	Petr Kulhavy <brain@jikos.cz>
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
