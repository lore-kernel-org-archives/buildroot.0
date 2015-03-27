From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 17:39:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/dovecot: add hash
Message-ID: <1427474381-577-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dovecot/dovecot.hash

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
new file mode 100644
index 0000000..7f2f9b1
--- /dev/null
+++ b/package/dovecot/dovecot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256sum	56ce1287a17fa88a2083116db00200deff1a5390af5eac1c8ae3f59a2079cff0	dovecot-2.2.16.tar.gz
-- 
1.7.10.4
