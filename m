From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 22:08:53 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: adopt freerdp
Message-ID: <20170218211018.D365280E48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c273e4907a3bcdb86e1a61cc6b9d584358ed7b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Julian only ever sent one patch to freerdp, the one adding it, in 2012.

I'm somewhat interested in this package, so I'll adopt it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f65909..09a0a6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -848,9 +848,6 @@ F:	package/rabbitmq-c/
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
 
-N:	Julian Lunz <git@jlunz.de>
-F:	package/freerdp/
-
 N:	Julian Scheel <julian@jusst.de>
 F:	package/bitstream/
 F:	package/cbootimage/
@@ -1618,6 +1615,7 @@ F:	package/celt051/
 F:	package/dtc/
 F:	package/dtv-scan-tables/
 F:	package/dvb-apps/
+F:	package/freerdp/
 F:	package/keyutils/
 F:	package/libbsd/
 F:	package/libedit/
