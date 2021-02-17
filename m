From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 08:08:59 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] DEVELOPERS: drop
 Guillaume Gardet, domain no longer exists
Message-ID: <20210217065257.804A581440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50d8628f9cd690e9b57222e3578b06f469ee3bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The oliseo.fr domain no longer responds to SMTP requests:

smtplib.SMTPRecipientsRefused: {'Guillaume Gardet <guillaume.gardet@oliseo.fr>': (550, b'5.1.2 <guillaume.gardet@oliseo.fr>: Recipient address rejected: Domain not found')}

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e79c34a5214d574558406b96601273227a1b133d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ec29a76ed8..e15592f0f6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1033,11 +1033,6 @@ F:	package/python-redis/
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
