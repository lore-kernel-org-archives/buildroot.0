From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:38:32 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] DEVELOPERS: drop Maxime
 Ripard from kmsxx maintainers
Message-ID: <20200828164643.2E29A85FE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d41d5c77f952cb78fbbf156a60d4003ddcaa3dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Maxime Ripard is no longer at Bootlin, his e-mail is bouncing:

<maxime.ripard@bootlin.com>: host spool.mail.gandi.net[217.70.178.1] said: 550
    5.1.1 <maxime.ripard@bootlin.com>: Recipient address rejected: User unknown
    in virtual mailbox table (in reply to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3a4053b585c49a839770e9e201a3b0e9044368ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 539a07511a..0321817ac3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1790,9 +1790,6 @@ F:	package/systemd-bootchart/
 F:	package/tinyalsa/
 F:	package/tinyxml/
 
-N:	Maxime Ripard <maxime.ripard@bootlin.com>
-F:	package/kmsxx/
-
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
