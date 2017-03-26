From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 27 Mar 2017 00:44:14 +0200
Subject: [Buildroot] [PATCH 1/1] syslog-ng: Bump version header in conf file
	to 3.9
Message-ID: <20170326224414.2163-1-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package version of syslog-ng is 3.9.1.
Bumping version number in syslog-ng.conf to 3.9

Fixing warning message about configuration file being too old.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 0b4a860cf..a3384eebc 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.7
+ at version: 3.9
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
-- 
2.12.0
