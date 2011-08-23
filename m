From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:09 +0200
Subject: [Buildroot] [PATCH 5/9] target/generic: create directories for
	cyrus-imapd
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 target/generic/device_table.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index 12f35b2..8f06c3f 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -10,6 +10,10 @@
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
 /home/default				d	2755	1000	1000	-	-	-	-	-
+/var/imap				d	750	88	8	-	-	-	-	-
+/var/imap-spool				d	750	88	8	-	-	-	-	-
+/var/imap/db				d	750	88	8	-	-	-	-	-
+/var/imap/socket 			d	750	88	8	-	-	-	-	-
 /bin/busybox				f	4755	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
-- 
1.7.4.1
