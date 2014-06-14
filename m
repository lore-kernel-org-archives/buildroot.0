From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:02:12 +0200
Subject: [Buildroot] [git commit] fetchmail: Update project URL after
	shutdown of berlios.de
Message-ID: <20140614170218.E1AF49CFE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f90eaf866b56f4230c28e794ac5bc02f9ecff596
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 3419821..1eb0359 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_FETCHMAIL
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local computer
 
-	  http://sourceforge.net/projects/fetchmail/
+	  http://www.fetchmail.info/
