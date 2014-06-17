From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Jun 2014 14:28:43 -0400
Subject: [Buildroot] [PATCH] manual: (faq-boot-hang-after-starting) fix
	config entries
Message-ID: <1403029723-11397-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 docs/manual/faq-troubleshooting.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 2fdb530..1cc113e 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -20,8 +20,8 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
 then it means that your system is running, but didn't start a shell on
 the serial console. In order to have the system start a shell on your
 serial console, you have to go into the Buildroot configuration, +System
-configuration+, and modify +Port to run a getty (login prompt) on+ and
-+Baudrate to use+ as appropriate. This will automatically tune the
+configuration+, and modify +Run a getty (login prompt) after boot+ and
++getty options+ as appropriate. This will automatically tune the
 +/etc/inittab+ file of the generated system so that a shell starts on
 the correct serial port.
 
-- 
2.0.0
