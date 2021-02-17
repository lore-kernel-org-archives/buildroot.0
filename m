From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 08:09:13 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] DEVELOPERS: drop
 Guillaume Gardet, domain no longer exists
Message-ID: <20210217065238.4D60785F08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c4b9af2666b1d7fc7f0d5f378af12d5da6947d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The oliseo.fr domain no longer responds to SMTP requests:

smtplib.SMTPRecipientsRefused: {'Guillaume Gardet <guillaume.gardet@oliseo.fr>': (550, b'5.1.2 <guillaume.gardet@oliseo.fr>: Recipient address rejected: Domain not found')}

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e79c34a5214d574558406b96601273227a1b133d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c31fcd2ce6..80d0136c37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1021,11 +1021,6 @@ F:	package/python-redis/
 F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 
-N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
-F:	package/c-icap/
-F:	package/c-icap-modules/
-F:	package/sdl2/
-
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 F:	package/pixiewps/
