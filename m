From: Chris Packham <judge.packham@gmail.com>
Date: Mon,  9 Sep 2019 21:54:31 +1200
Subject: [Buildroot] [PATCH 1/2] syslog-ng: update version in config file
Message-ID: <20190909095432.3935-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

syslog-ng warns when using a configuration from an older version. Update
the version in the example config.

Fixes: 9695f3e069 ("package/syslog-ng: bump version to 3.22.1")
Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 9a56a1302d..cab3a7e75a 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.19
+ at version: 3.22
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
-- 
2.23.0
