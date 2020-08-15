From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 10:08:07 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: drop Maxime Ripard from kmsxx
 maintainers
Message-ID: <20200815080154.5EB0B82673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a4053b585c49a839770e9e201a3b0e9044368ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maxime Ripard is no longer at Bootlin, his e-mail is bouncing:

<maxime.ripard@bootlin.com>: host spool.mail.gandi.net[217.70.178.1] said: 550
    5.1.1 <maxime.ripard@bootlin.com>: Recipient address rejected: User unknown
    in virtual mailbox table (in reply to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42fa5a4956..35840ec9a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1813,9 +1813,6 @@ F:	package/systemd-bootchart/
 F:	package/tinyalsa/
 F:	package/tinyxml/
 
-N:	Maxime Ripard <maxime.ripard@bootlin.com>
-F:	package/kmsxx/
-
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
