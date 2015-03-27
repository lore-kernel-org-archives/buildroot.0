From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 17:39:41 +0100
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: add hash
In-Reply-To: <1427474381-577-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427474381-577-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427474381-577-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dovecot-pigeonhole/dovecot-pigeonhole.hash

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
new file mode 100644
index 0000000..6353a86
--- /dev/null
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	04a13ec11652cbff812519eacf4db7dda648ab5c4c5f63b43a437d1fb0cc8d2a	dovecot-2.2-pigeonhole-0.4.7.tar.gz
-- 
1.7.10.4
