From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 12:12:59 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] DEVELOPERS: remove Daniel
 Nystrom
Message-ID: <20191207110737.E12178855A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c78f42e4be5a3fde288680c1d8971213c97f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

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
index 4adaac0c3d..5c80a21af7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -610,9 +610,6 @@ F:	package/log4cpp/
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
 
-N:	Daniel Nystr??m <daniel.nystrom@timeterminal.se>
-F:	package/e2tools/
-
 N:	Daniel Price <daniel.price@gmail.com>
 F:	package/nodejs/
 F:	package/redis/
