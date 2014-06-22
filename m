From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:21:31 +0200
Subject: [Buildroot] [git commit] manual: (faq-boot-hang-after-starting) fix
	config entries
Message-ID: <20140622172136.B207B9D04E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ab109869fe1758e47c75edd16b20af1db05e1fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/faq-troubleshooting.txt |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 2fdb530..26c8460 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -19,11 +19,11 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
 
 then it means that your system is running, but didn't start a shell on
 the serial console. In order to have the system start a shell on your
-serial console, you have to go into the Buildroot configuration, +System
-configuration+, and modify +Port to run a getty (login prompt) on+ and
-+Baudrate to use+ as appropriate. This will automatically tune the
-+/etc/inittab+ file of the generated system so that a shell starts on
-the correct serial port.
+serial console, you have to go into the Buildroot configuration, in 
++System configuration+, modify +Run a getty (login prompt) after boot+ 
+and set the appropriate port and baud rate in the +getty options+ 
+submenu. This will automatically tune the +/etc/inittab+ file of the 
+generated system so that a shell starts on the correct serial port.
 
 [[faq-no-compiler-on-target]]
 == Why is there no compiler on the target?
