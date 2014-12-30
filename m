From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 17:19:39 +0100
Subject: [Buildroot] [PATCH] ntp: fix hash file
Message-ID: <1419956379-30058-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a space between the hash and filename so the hash can be used.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/ntp.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 2ff6449..1d1b907 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,2 +1,2 @@
 # From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8.tar.gz.md5
-md5	6972a626be6150db8cfbd0b63d8719e7ntp-4.2.8.tar.gz
+md5	6972a626be6150db8cfbd0b63d8719e7 ntp-4.2.8.tar.gz
-- 
2.1.0
