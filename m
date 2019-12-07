From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 12:12:55 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] DEVELOPERS: remove Daniel
 Nystrom
Message-ID: <20191207110728.DBB658853A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa96726ef07ec2e80fe987557ce06480240fe393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

<daniel.nystrom@timeterminal.se>: host ASPMX.L.GOOGLE.COM[172.217.218.26] said:
    550-5.1.1 The email account that you tried to reach does not exist. Please
    try 550-5.1.1 double-checking the recipient's email address for typos or
    550-5.1.1 unnecessary spaces. Learn more at 550 5.1.1
    https://support.google.com/mail/?p=NoSuchUser o14si10209151edi.116 - gsmtp
    (in reply to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9eb59a88ad2d0658069edfaf4c39b48911d8abd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a44c95d043..a641f6cdf2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -593,9 +593,6 @@ F:	package/log4cpp/
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
 
-N:	Daniel Nystr??m <daniel.nystrom@timeterminal.se>
-F:	package/e2tools/
-
 N:	Daniel Price <daniel.price@gmail.com>
 F:	package/nodejs/
 F:	package/redis/
