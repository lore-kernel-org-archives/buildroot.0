From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Jul 2021 15:28:58 +0200
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: drop Jan Viktorin
Message-ID: <20210712132900.1263430-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately, his e-mail is bouncing:

<viktorin@rehivetech.com>: host wes1-mx2.wedos.net[46.28.106.12] said: 550
    5.2.1 <viktorin@rehivetech.com>: Recipient address rejected: mailbox
    disabled - DEBUG: acc viktorin at rehivetech.com (in reply to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a69f88299..ae049140f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1268,11 +1268,6 @@ F:	package/sysrepo/
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
 
-N:	Jan Viktorin <viktorin@rehivetech.com>
-F:	package/python-pexpect/
-F:	package/python-ptyprocess/
-F:	package/zynq-boot-bin/
-
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
 
-- 
2.31.1
