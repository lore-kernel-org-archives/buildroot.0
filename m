From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 09:45:44 +0100
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop Guillaume
 Gardet, domain no longer exists
Message-ID: <20210216082426.2678883F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf77733dbb616731857e238b6ae11f808499a69b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The oliseo.fr domain no longer responds to SMTP requests:

smtplib.SMTPRecipientsRefused: {'Guillaume Gardet <guillaume.gardet@oliseo.fr>': (550, b'5.1.2 <guillaume.gardet@oliseo.fr>: Recipient address rejected: Domain not found')}

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 361ee2f35a..7ab3587315 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,11 +1052,6 @@ F:	package/python-redis/
 F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 
-N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
-F:	package/c-icap/
-F:	package/c-icap-modules/
-F:	package/sdl2/
-
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/liquid-dsp/
